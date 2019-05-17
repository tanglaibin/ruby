require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DemoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.to_prepare do
      Devise::SessionsController.layout "common_guest"
      Devise::ConfirmationsController.layout "common_guest"
      Devise::UnlocksController.layout "common_guest"
      Devise::PasswordsController.layout "common_guest"
      Devise::RegistrationsController.layout "common"
    end
  end
end
