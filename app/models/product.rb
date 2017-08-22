# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  producer         :string(255)
#  price            :float(24)
#  quantity         :integer
#  description      :text(65535)
#  categorical_type :string(255)
#  categorical_id   :integer
#  shop_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Product < ApplicationRecord
  # =============Association================

  has_many :comments
  has_many :users, through: :comments

  has_many :products_purchase_orders
  has_many :purchase_orders, through: :products_purchase_orders

  has_many :products_delivery_orders
  has_many :delivery_orders, through: :products_delivery_orders

  has_many :images
  belongs_to :categorical, polymorphic: true
  belongs_to :shop

  # ==============Friendly_url================
  extend FriendlyId
  friendly_id :name, use: :slugged
end
