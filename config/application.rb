require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RestobotV4
  class Application < Rails::Application
    if Rails.env.development? 
      config.action_controller.asset_host = 'http://localhost:3000'
      config.action_mailer.asset_host = config.action_controller.asset_host
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.assets.paths << "#{Rails.root}/app/assets/stylesheets/font-awesome-4.7.0/css/"
    #config.assets.paths << "#{Rails.root}/app/assets/stylesheets/style.css"
    #config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    # config.active_job.queue_adapter = :delayed_job
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
