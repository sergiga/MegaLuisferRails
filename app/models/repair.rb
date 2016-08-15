class Repair < ApplicationRecord
  has_one :bill
  has_one :client, through: :bill
  has_one :phone
end
