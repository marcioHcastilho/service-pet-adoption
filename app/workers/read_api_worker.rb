class ReadApiWorker
  include Sidekiq::Worker

  def perform
    breed_names = %w[caucasian_shepherd_dog bouvier_des_flandres grand_basset_griffon_vendeen]
    breed_names.each do |breed_name|
      breed_info = DogApiService.get_breed_info(breed_name)

      next unless breed_info.present?

      Pet.create!(
        name: breed_name,
        description: breed_info[:description],
        life_span: breed_info[:life_span],
        male_weight: breed_info[:male_weight],
        female_weight: breed_info[:female_weight]
      )
    rescue StandardError => e
      logger.error "Failed to process breed #{breed_name}: #{e.message}"
    end
  end
end
