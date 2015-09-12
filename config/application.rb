require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(*Rails.groups)

module CharityShop
  class Application < Rails::Application
    config.time_zone = 'Dhaka'
    config.i18n.default_locale = :en
    config.active_record.raise_in_transactional_callbacks = true
  end
end
