class Order < ApplicationRecord
  belongs_to :client, inverse_of: :orders
  has_many :repairs, inverse_of: :order

end
