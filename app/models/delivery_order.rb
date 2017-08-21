# == Schema Information
#
# Table name: delivery_orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DeliveryOrder < ApplicationRecord
  belongs_to :user

  has_many :products_delivery_orders
  has_many :products, through: :products_delivery_orders
end
