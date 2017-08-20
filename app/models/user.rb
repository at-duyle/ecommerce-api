class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :products, through: :comments
  has_many :delivery_orders

  enum gender: %w[male female other]
end
