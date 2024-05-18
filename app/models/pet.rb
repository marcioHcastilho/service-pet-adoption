class Pet < ApplicationRecord
  belongs_to :owner

  validates :name, presence: true
  validates :pet_type, presence: true
  validates :breed, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }

  def update_weight(new_weight)
    update(weight: new_weight)
  end
end
