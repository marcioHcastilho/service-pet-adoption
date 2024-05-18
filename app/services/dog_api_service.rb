class DogApiService
  include HTTParty
  base_uri 'https://dogapi.dog'

  def self.get_breed_info(breed_name)
    response = fetch_breeds
    breed = find_breed(response, breed_name)
    return unless breed

    parse_breed_info(breed['attributes'])
  end

  def self.fetch_breeds
    get("/api/v2/breeds")
  end

  def self.find_breed(response, breed_name)
    breeds = JSON.parse(response.body)['data']
    breeds.find { |b| b['attributes']['name'].casecmp(breed_name).zero? }
  end

  def self.parse_breed_info(attributes)
    {
      breed: attributes['name'],
      description: attributes['description'],
      life_span: "#{attributes['life']['min']} - #{attributes['life']['max']} years",
      male_weight: "#{attributes['male_weight']['min']} - #{attributes['male_weight']['max']} kg",
      female_weight: "#{attributes['female_weight']['min']} - #{attributes['female_weight']['max']} kg"
    }
  end
end
