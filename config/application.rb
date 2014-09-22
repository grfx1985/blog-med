require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'
#require 'iconv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppRailsAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address  => "mail.activeweb.pl",
        :port  => 25,
        :domain  => "activeweb.pl",
        :user_name  => "automail@activeweb.pl",
        :password  => 'qwe135',
        :authentication  => :login,
        :tls => false,
        :ssl => false,
        :enable_starttls_auto => false,
        :openssl_verify_mode  => 'none'
    }
    ActionMailer::Base.smtp_settings[:openssl_verify_mode] = false
    ActionMailer::Base.smtp_settings[:enable_starttls_auto] = false


    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
