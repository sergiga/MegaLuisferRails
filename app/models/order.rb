class Order < ApplicationRecord
  belongs_to :client, inverse_of: :orders
  has_many :repairs, inverse_of: :order
  accepts_nested_attributes_for :repairs

  validates :price, presence: true
end
