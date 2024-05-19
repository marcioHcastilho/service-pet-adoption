module OwnerValidatable
  extend ActiveSupport::Concern

  included do
    validates :email, presence: true
    validates :phone, presence: true
  end
end
