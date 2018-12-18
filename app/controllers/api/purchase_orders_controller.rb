class Api::PurchaseOrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_branches, only: :index
    
    def index
        @suppliers = current_brand.suppliers.map { |x| { label: x.name, value: x.id } }.to_a
        @purchase_orders = current_brand.purchase_orders.approved_pos.includes(:purchase_order_items).where.not( purchase_order_items: { purchase_order_id: nil } ).where( po_date: Date.today.beginning_of_week..Date.today.end_of_week ).paginate(page: params[:page], per_page: 30)
        @items = current_brand.items.all.map { |x| { label: x.name, value: x.id } }.to_a
        if params[:format] == 'xlsx'
            render xlsx: "Purchase Orders", template: "api/purchase_orders/index"
        end  
    end

    def get_pos    
        pp = 30
        page_num = params[:page]
        @items  = params[:items]
        pos = if params[:date].present?
            from = Date.strptime(params[:date][0], "%m/%d/%Y")
            to = Date.strptime(params[:date][1], "%m/%d/%Y") 
            current_brand.purchase_orders.approved_pos.where(po_date: from..to).dynamic_search(
                params[:po_number],
                params[:suppliers],
                params[:branches],
                params[:items],
                params[:status],
                params[:creator]     
            )   
        else
            current_brand.purchase_orders.approved_pos.dynamic_search(
                params[:po_number],
                params[:suppliers],
                params[:branches],
                params[:items],
                params[:status],
                params[:creator]     
            )
        end
        @purchase_orders = pos.paginate(page: page_num, per_page: pp)
        batch = page_num.present? ? page_num.to_i * pp : 1 * pp
        @all_purchase_orders = pos.first(batch)
        @suppliers = params[:suppliers]
        respond_to do |format|
            format.json
            format.xlsx { render xlsx: "Purchase Orders", template: 'api/purchase_orders/get_pos' }
        end
    end

    def summary
        @branches = current_brand.branches.map { |x| { label: x.name, value: x.id } }.to_a        
        @purchase_orders = if client_admin?
                                if params[:date].present? && params[:branch].present?
                                    from = Date.strptime(params[:date][0], "%m/%d/%Y")
                                    to = Date.strptime(params[:date][1], "%m/%d/%Y")
                                    current_brand.purchase_order_items.includes(:purchase_order).where( purchase_orders: { po_date: from..to, branch_id: params[:branch] } ).group_by { |item| item.purchase_order.supplier }
                                else 
                                    []
                                end
                            else
                                if branch_admin?
                                    if params[:date].present?
                                        from = Date.strptime(params[:date][0], "%m/%d/%Y")
                                        to = Date.strptime(params[:date][1], "%m/%d/%Y")
                                        current_user.brand.purchase_order_items.includes(:purchase_order).where( purchase_orders: { po_date: from..to, branch_id: current_user.branch.id } ).group_by { |item| item.purchase_order.supplier }
                                    else
                                        current_user.brand.purchase_order_items.includes(:purchase_order).where( purchase_orders: { po_date: Date.today.last_week..Date.today, branch_id: current_user.branch.id } ).group_by { |item| item.purchase_order.supplier }
                                    end                                        
                                else
                                    if params[:date].present? && params[:branch].present?
                                        from = Date.strptime(params[:date][0], "%m/%d/%Y")
                                        to = Date.strptime(params[:date][1], "%m/%d/%Y")
                                        current_user.brand.purchase_order_items.includes(:purchase_order).where( purchase_orders: { po_date: from..to, branch_id: params[:branch] } ).group_by { |item| item.purchase_order.supplier }
                                    else
                                        []
                                    end
                                end
                            end
        @date_range = params[:date].present? ? "#{Date.strptime(params[:date][0],'%m/%d/%Y').strftime('%b %d, %Y')} - #{Date.strptime(params[:date][1],'%m/%d/%Y').strftime('%b %d, %Y')}" : "#{Date.today.days_ago(6).strftime('%b %d, %Y')} - #{Date.today.strftime('%b %d, %Y')}"
        if params[:format] == 'pdf' && @purchase_orders.present?
            render template: 'api/purchase_orders/summary', pdf: "Purchase List (#{@date_range})", orientation: 'Landscape', :page_width   => '13in',
                :margin => {:top       => 15,
                                :bottom   => 15
                            }
        end  
    end

    private
        def set_branches
            @branches = current_client.on_free_trial? ? current_brand.branches.map { |x| { label: x.name, value: x.id } }.to_a : current_brand.subscribed_branches.map { |x| { label: x.name, value: x.id } }.to_a
        end
end