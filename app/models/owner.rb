class Owner < ApplicationRecord
  has_many :pets

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
