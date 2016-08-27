class Client < ApplicationRecord
  has_many :orders, inverse_of: :client
  has_many :repairs, through: :orders
  accepts_nested_attributes_for :orders

  validates :cif_dni, presence: true
  validates :name, presence: true
  validates :contact_phone, presence: true

  def self.search (search)
    @client = Client.find_by(cif_dni: search) || Client.new
  end
end
