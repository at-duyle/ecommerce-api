# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#

class SubCategory < ApplicationRecord
  # =============Association=================
  belongs_to :category
  has_many :products, as: :categorical

  # ==============Friendly_url===============
  extend FriendlyId
  friendly_id :name, use: :slugged
end
