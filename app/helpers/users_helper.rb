module UsersHelper
    def avatar_for(user, options = { size: 40 })
        size = options[:size]
        style = options[:style]
        if user.avatar?
            if size <= 40
                image_tag user.avatar.url(:thumb), width: size, height: size, alt: user.username, class: 'avatar-image', style: style
            else
                image_tag user.avatar.url, width: size, height: size, alt: user.username, class: 'avatar-image', style: style
            end
        else
            image_tag user.avatar.url, width: size, height: size, alt: 'avatar image', class: 'avatar-image', style: style
        end
    end

    def avatar_image_for(brand, options = { size: 40 })
        size = options[:size]
        style = options[:style]
        if brand.avatar?
            if size <= 40
                image_tag brand.avatar.url(:thumb), width: size, height: size, alt: brand.name, class: 'brand-avatar', style: style
            else
                image_tag brand.avatar.url, width: size, height: size, alt: brand.name, class: 'brand-avatar', style: style
            end
        else
            image_tag brand.avatar.url, width: size, height: size, alt: 'avatar image', class: 'brand-avatar', style: style
        end
    end

    def client_avatar(client, options = { size: 40 })
        size = options[:size]
        style = options[:style]
        if client.avatar?
            if size <= 40
                image_tag client.avatar.url(:thumb), width: size, height: size, alt: client.name, class: 'avatar-image', style: style
            else
                image_tag client.avatar.url, width: size, height: size, alt: client.name, class: 'avatar-image', style: style
            end
        else
            image_tag client.avatar.url, width: size, height: size, alt: 'avatar image', class: 'avatar-image', style: style
        end
    end
end