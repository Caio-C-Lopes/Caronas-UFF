require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module MeuProjeto
  class Application < Rails::Application
    config.i18n.default_locale = :'pt-BR'
    config.load_defaults 6.0

  end
end

  