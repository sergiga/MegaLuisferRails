class Bill < ApplicationRecord
  belongs_to :client, inverse_of: :bills
  has_many :repairs, inverse_of: :bill
  accepts_nested_attributes_for :repairs
end
