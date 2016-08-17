class Repair < ApplicationRecord
  belongs_to :bill
  has_one :phone
end
