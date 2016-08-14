class Repair < ApplicationRecord
  has_one :bill
  has_one :client, through: :bill
end
