require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module MeuProjeto
  class Application < Rails::Application
    config.i18n.default_locale = :'pt-BR'
    config.load_defaults 6.0
    config.generators.system_tests = nil
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end

  