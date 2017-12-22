require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    config.load_defaults 5.1
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
      config.i18n.default_locale = :ja
     end
    end
  end
end

