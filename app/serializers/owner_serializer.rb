class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone
  has_many :pets, serializer: PetSerializer
end
