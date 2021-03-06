json.next_page @activities.next_page
json.activities do |json|
    json.array! @activities do |activity|
        json.id activity.id
        json.brand_id activity.brand_id
        json.doer activity.user == current_user ? 'You' : activity.user.username
        json.action activity.action
        json.avatar avatar_for(activity.user)
        json.type activity.recordable.class.to_s.underscore.humanize.downcase
        json.url case activity.recordable.class.to_s
                when "Sale" then sale_path(activity.recordable)
                when "PurchaseItem" then purchase_purchase_items_path(purchase_id: activity.recordable.purchase.id, id: activity.recordable)
                end
        json.time_ago time_ago_in_words(activity.created_at) + " ago"
        json.color activity.user.role.role_level.eql?('branch') ? activity.user.branch.color : activity.user.role.role_level.eql?('brand') ? '#00aced' : '#10374D'
    end
end