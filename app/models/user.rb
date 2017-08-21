# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  name            :string(255)
#  gender          :integer
#  avatar          :string(255)
#  auth_token      :string(255)
#  confirm_send_at :datetime
#  confirm_token   :string(255)
#  confirm_at      :datetime
#  reset_send_at   :datetime
#  reset_token     :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  # ================Association=====================
  has_many :comments
  has_many :products, through: :comments
  has_many :delivery_orders

  # ================ENUMS=====================
  enum gender: %w[male female other]

  # ================Validates=====================
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates_confirmation_of :password
  validates_format_of :email, with: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
