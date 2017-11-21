module UsersHelper
    def avatar_for(user, options = { size: 30 })
        size = options[:size]
        style = options[:style]
        if user.avatar?
            if size <= 30
                image_tag user.avatar.url(:thumb), width: size, height: size, alt: user.username, class: 'avatar-image', style: style
            else
                image_tag user.avatar.url, width: size, height: size, alt: user.username, class: 'avatar-image', style: style
            end
        else
            image_tag '/public/img/male-placeholder.png', width: size, height: size, alt: 'avatar image', class: 'avatar-image', style: style
        end
    end
end