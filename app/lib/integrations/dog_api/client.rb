module Integrations
  module DogApi
    class Client
      include HTTParty
      base_uri 'https://dogapi.dog'

      def self.get(path)
        response = super(path)
        raise "Error: #{response.code}" unless response.success?

        response
      end
    end
  end
end
