# == Schema Information
#
# Table name: requests
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone_number :string
#  shop_name    :string
#  shop_address :string
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Request < ApplicationRecord
  # ================Validates=====================
  validates :name, :email, :phone_number, :shop_name, :latitude, :longitude,
            :shop_address, presence: true
  validates :name, :shop_name, :email, uniqueness: true
  validates_format_of :email, with: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates_format_of :phone_number, with: /\A0(1\d{9}|9\d{8})\z/
end
