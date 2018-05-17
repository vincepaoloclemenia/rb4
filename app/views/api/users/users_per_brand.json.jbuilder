json.users do |json|
    json.array! @users do |user|
    json.id user.id
        json.full_name user.full_name
        json.role user.role.name
        json.username user.username
        json.color user.role.role_level.eql?('branch') ? user.branch.color : '#10374D'
        json.obligation user.role.role_level.eql?('branch') ? user.branch.name : user.role.role_level.eql?('brand') ? user.brand.name : user.client.name
    end
end