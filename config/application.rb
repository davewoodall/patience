require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Patience
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.fixtures false
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
      g.routing_specs false
      g.assets false
      g.helper false
    end
  end
end
