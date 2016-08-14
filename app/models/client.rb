class Client < ApplicationRecord
  has_many :bills
  has_many :repairs, through: :bills
end
