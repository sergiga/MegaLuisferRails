class Order < ApplicationRecord
  belongs_to :client, inverse_of: :orders, optional: true
  has_many :repairs, inverse_of: :order

  validates :price, presence: true, on: :order_setup
  validate :client_exists, on: :order_setup
  validate :has_at_least_one_order_item, on: :order_setup

  def client_exists
    errors.add(:client, "An order must have one client") if self.client.nil?
  end

  def has_at_least_one_order_item
    errors.add(:repairs, "An order must have at least one order item") unless self.has_order_items?
  end

  def has_order_items?
    self.repairs.any?
  end
end
