module PetValidatable
  extend ActiveSupport::Concern

  included do
    validates :pet_type, presence: true
    validates :breed, presence: true
    validates :weight, numericality: { greater_than_or_equal_to: 0 }
  end
end
