# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  phone_number :string
#  logo         :string
#  latitude     :float
#  longitude    :float
#  admin_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  available    :boolean          default(TRUE)
#  slug         :string
#

class Shop < ApplicationRecord
  # =============Association=================
  has_many :admins
  has_one :admin
  has_many :products

  # ==============Friendly_url================
  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
