# == Schema Information
#
# Table name: delivery_orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#  status     :integer          default(0)
#

class DeliveryOrder < ApplicationRecord
  # ====================Association=====================
  belongs_to :user

  has_many :products_delivery_orders
  has_many :products, through: :products_delivery_orders

  # ===================Enum==========================
  enum status: %w[ordered delivered completed]
end
