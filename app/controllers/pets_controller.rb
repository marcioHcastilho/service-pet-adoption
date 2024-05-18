class PetsController < ApplicationController
  before_action :set_pet, only: [:update, :destroy, :update_weight]

  def index
    @pets = Pet.all
    pets_with_details = []

    @pets.each do |pet|
      breed_info = DogApiService.get_breed_info(pet.breed)
      pet_details = pet.attributes.symbolize_keys.slice(:id, :name, :pet_type, :breed, :weight, :owner_id, :created_at, :updated_at)
      pet_details.merge!(breed_info.slice(:description, :life_span, :male_weight, :female_weight)) if breed_info.present? && breed_info[:breed].casecmp?(pet.breed)
      pets_with_details << pet_details
    end

    render json: pets_with_details
  end

  def show
    @pet = Pet.find(params[:id])
    breed_info = DogApiService.get_breed_info(@pet.breed)

    Rails.logger.info "Breed info #{breed_info.present? ? 'found' : 'not found'} for #{@pet.breed}"

    @pet_details = @pet.attributes.symbolize_keys.slice(:id, :name, :pet_type, :breed, :weight, :owner_id, :created_at, :updated_at)
    @pet_details.merge!(breed_info.slice(:description, :life_span, :male_weight, :female_weight)) if breed_info.present? && breed_info[:breed].casecmp?(@pet.breed)

    render json: @pet_details
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, status: :created


    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def update_weight
    new_weight = params[:weight]
    if @pet.update_weight(new_weight)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    render json: { message: 'Pet deleted successfully' }, status: :ok
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :weight, :owner_id)
  end
end
