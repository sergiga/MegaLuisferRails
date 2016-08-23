class Client < ApplicationRecord
  has_many :bills, inverse_of: :client
  has_many :repairs, through: :bills
  accepts_nested_attributes_for :bills

  validates :cif_dni, presence: true
  validates :name, presence: true
  validates :contact_phone, presence: true

  def self.search (search)
    @client = Client.find_by(cif_dni: search) || Client.new
  end
end
