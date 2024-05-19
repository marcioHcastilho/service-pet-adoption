class ReadApiWorker
  include Sidekiq::Worker

  def perform
    response = DogApiService.fetch_breeds

    return unless response.present? && response.code == 200

    breeds = JSON.parse(response.body)['data']

    breeds.each do |breed|
      breed_info = DogApiService.parse_breed_info(breed['attributes'])

      next unless breed_info.present?

      BreedInfo.create!(
        name: breed_info[:breed],
        description: breed_info[:description],
        life_span: breed_info[:life_span],
        male_weight: breed_info[:male_weight],
        female_weight: breed_info[:female_weight]
      )
    rescue StandardError => e
      logger.error "Failed to process breed #{breed['attributes']['name']}: #{e.message}"
    end
  end
end
