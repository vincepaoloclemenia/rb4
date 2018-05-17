json.company_admins do |json|
    json.array! @company_admins do |user|
        json.id user.id
        json.avatar avatar_for(user, size: 100)
        json.full_name user.full_name
        json.role user.role.name
        json.level user.role.role_level
        json.username user.username
        json.color '#10374D'
        json.obligation user.client.name
        json.email user.email
    end
end

json.branch_admins do |json|
    json.array! @branch_admins do |user|
        json.id user.id
        json.avatar avatar_for(user, size: 100)
        json.full_name user.full_name
        json.role user.role.name
        json.level user.role.role_level
        json.username user.username
        json.color user.branch.color 
        json.obligation user.branch.name
        json.email user.email
    end
end

json.brand_admins do |json|
    json.array! @brand_admins do |user|
        json.id user.id
        json.avatar avatar_for(user, size: 100)
        json.full_name user.full_name
        json.role user.role.name
        json.level user.role.role_level
        json.username user.username
        json.color '#1D75A1'
        json.obligation user.brand.name
        json.email user.email
    end
end