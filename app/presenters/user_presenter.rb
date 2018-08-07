class UserPresenter < BasePresenter
    #include ActionView::Helpers::UrlHelper
    presents :user

    def display_tab?(*pages)
        return pages.map { |page| permitted?(page) }.include?(true)
    end

    def link(model, page, action, url)
        if permitted?(model)
            h.content_tag(:li, h.link_to(generated_icon(page), url), class: h.controller.controller_name == page && h.controller.action_name == action ? 'active-link' : '')
        end
    end
    def sub_link(model, page, action, link_name, url)
        if permitted?(model)
            h.content_tag(:li, h.link_to(link_name, url), class: h.controller.controller_name == page && h.controller.action_name == action ? 'active-link' : '')
        end
	end

    def generated_icon(page)
        case page
        when "purchase_orders" then "<i class='fa icon-glyph-109'></i> <span>Purchase Order Generator</span>".html_safe
        when "sales" then "<i class='fa icon-glyph-14'></i> <span>Sales Report</span>".html_safe
        when "subscriptions" then "<i class='fa icon-glyph-170'></i> <span>Subscriptions</span>".html_safe
        when "settings" then "<i class='fa icon-glyph-90'></i> <span>Settings</span>".html_safe
        end
    end

    def client_on_free_trial?
        user.client.on_free_trial?
    end

    def has_paid_subscriptions?
        user.branch.subscribed?
    end

    private

        def permitted?(page)
            section = Section.find_by_name(page)
            permission = section.nil? ? nil : user.role.permissions.find_by_section_id(section.id)
            if permission
                return (permission.is_read? || permission.is_create? || permission.is_update? || permission.is_destroy?)
            else
                return false
            end
        end

        
end