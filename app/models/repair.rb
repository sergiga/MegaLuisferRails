class Repair < ApplicationRecord
  belongs_to :bill, inverse_of: :repairs
  has_one :phone

  validates :description, presence: true
end
