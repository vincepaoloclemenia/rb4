users = @roles.keys.sort.map do |role, index|  
            users_per_role = role.gsub(/\d+/,"") == "Branch Administrator" ? @roles[role].sort_by { |u| u.branch.id } : @roles[role]
            { 
                role_name: role.gsub(/\d+/,"").pluralize,
                users: 
                    users_per_role.map do |user|
                        obligation = user.role.role_level == "branch" ? user.branch.name : user.role.role_level == "brand" ? user.brand.name : ''
                        color = user.role.role_level == "branch" ? user.branch.color : user.role.role_level == "brand" ? "#1D75A1" : "#10374D"
                        {
                            id: user.id,
                            full_name: user.full_name,
                            avatar: avatar_for(user, size: 80, style: "border: 3px solid #{color}"),
                            role: user.role.name,
                            level: user.role.role_level,
                            username: user.username,
                            color: color, 
                            obligation: obligation,
                            email: user.email,
                            branch_admin: user.branch.present?,
                            branch: user.branch.present? ? user.branch.name : '',
                            last_sign_in: user.last_sign_in_at.present? ? time_ago_in_words(user.last_sign_in_at) + " ago" : ''
                        }
                    end
                
            }
        end
json.company_users users