require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module PetAdoption
  class Application < Rails::Application
    config.load_defaults 7.1

    Dotenv::Railtie.load

    # Configuração do Sidekiq
    config.active_job.queue_adapter = :sidekiq

    # Auto-load da pasta lib
    config.autoload_paths += %W(#{config.root}/lib)

    # Configuração para API
    config.api_only = true
  end
end
