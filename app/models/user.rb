class User < ApplicationRecord
  has_may :comments
  has_may :products, through: :comments
  has_may :delivery_orders

  enum gender: %w[male female other]
end
