class Owner < ApplicationRecord
  include Validatable
  include OwnerValidatable
  has_many :pets
end
