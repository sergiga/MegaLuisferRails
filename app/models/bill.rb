class Bill < ApplicationRecord
  belongs_to :client
  has_many :repairs
end
