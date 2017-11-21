json.activities do |json|
    json.array! @activities do |activity|
        json.id activity.id
        json.brand_id activity.brand_id
        json.user_id activity.user_id
        json.action activity.action
        json.name activity.user.username
        json.avatar activity.user.avatar
    end
end