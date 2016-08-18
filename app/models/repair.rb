class Repair < ApplicationRecord
  belongs_to :bill, inverse_of: :repairs
  has_one :phone
end
