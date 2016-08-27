class Client < ApplicationRecord
  has_many :orders, inverse_of: :client
  has_many :repairs, through: :orders

  validates :cif_dni, presence: true, on: :order_setup
  validates :name, presence: true, on: :order_setup
  validates :contact_phone, presence: true, on: :order_setup


  def self.search (search)
    self.find_by(cif_dni: search) || self.new
  end
end
