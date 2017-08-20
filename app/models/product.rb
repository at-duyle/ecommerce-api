class Product < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments

  has_many :products_purchase_orders
  has_many :purchase_orders, through: :products_purchase_orders

  has_many :products_delivery_orders
  has_many :delivery_orders, through: :products_delivery_orders

  has_many :images
  belongs_to :sub_category
  belongs_to :shop
end
