module PurchaseOrderHelper

    def po_number_format(branch)
        @order_list_id = PurchaseOrder.all.select(:id).order("id ASC").last
        if @order_list_id.nil? 
          @my_id = 1
          @n = "%02d" % @my_id
          @title = "PRN"
          date = Date.today.strftime('%m%d%y')    
          return @title.to_s+'-'+branch.aka+'-'+@n.to_s+date.to_s
        else
          @my_id = @order_list_id.id.to_i + 1
          @n = "%02d" % @my_id
          @title = "PR"
          date = Date.today.strftime('%m%d%y')    
          return @title.to_s+'-'+branch.aka+'-'+@n.to_s+date.to_s
        end
    end

    def po_approval_format(po)
      if po.po_reference.present?
        ref = "%02d" % po.po_reference
        date = Date.today.strftime('%m%d%y') 
        return "PO-#{po.branch.aka}-"+ref.to_s+date.to_s
      else
        return po.pr_number.gsub('PR', 'PO')
      end
    end

end