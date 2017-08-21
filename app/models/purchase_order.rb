# == Schema Information
#
# Table name: purchase_orders
#
#  id         :integer          not null, primary key
#  supplier   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PurchaseOrder < ApplicationRecord
  has_many :products_purchase_orders
  has_many :products, through: :products_purchase_orders
end
