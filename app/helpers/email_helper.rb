module EmailHelper
    def email_image_tag(brand, **options)
      attachments[brand] = File.read(Rails.root.join("#{brand.avatar.url}"))
      image_tag attachments[image].url, **options
    end
end