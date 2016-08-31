class Repair < ApplicationRecord
  belongs_to :order, inverse_of: :repairs
  belongs_to :phone

  validates :description, presence: true
end
