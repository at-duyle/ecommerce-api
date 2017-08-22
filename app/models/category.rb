# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  # =============Association==================
  has_many :sub_categories
  has_many :products, as: :categorical

  # ==============Friendly_url================
  extend FriendlyId
  friendly_id :name, use: :slugged
end
