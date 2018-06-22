module PurchaseOrderHelper

    def po_number_format(branch)
        next_id = PurchaseOrder.all.present? ? PurchaseOrder.maximum(:id).next : 1        
        pr_num = "%02d" % next_id
        title = "PR"
        date = Date.today.strftime('%m%d%y')    
        return "#{title}-#{branch.aka}-#{pr_num.to_s}#{date.to_s}"
    end

    def po_approval_format(po)
      return po.pr_number.gsub('PR', 'PO')
    end

end