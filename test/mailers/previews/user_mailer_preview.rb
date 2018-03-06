# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def send_purchase_order
        @po = PurchaseOrder.find(80)
        @poi = @po.purchase_order_items
        @user = User.find 2
        @subject = 'Sample'
        @recipient = 'vincentpaoloclemenia@gmail.com'
        @contact = 'Paolo'
        @title = 'Jr. Apps Dev'
        @message = 'Sample Message'
        UserMailer.send_purchase_order(@po, @poi, @user, @recipient, @subject, @contact, @title, @message)
        #mail to: @my_emails, subject: "PO-#{@purchase_order.branch.aka}-#{@purchase_order.supplier.name}-#{Date.today.strftime('%B %d')}", content_type: "text/html"
    end
end
