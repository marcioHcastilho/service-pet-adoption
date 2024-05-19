class Pet < ApplicationRecord
  include Validatable
  include PetValidatable
  belongs_to :owner


  def update_weight(new_weight)
    update(weight: new_weight)
  end

  def breed_info
    @breed_info ||= Integrations::DogApi::BreedInfoService.get_breed_info(breed) || {}
  end
end
