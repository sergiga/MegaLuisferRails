class Bill < ApplicationRecord
  has_one :client
  has_many :repairs
end
