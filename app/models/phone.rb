class Phone < ApplicationRecord
  has_many :repairs
  belongs_to :phone_brand
end
