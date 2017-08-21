# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  name            :string(255)
#  gender          :integer
#  avatar          :string(255)
#  role            :integer          default("partner")
#  auth_token      :string(255)
#  confirm_send_at :datetime
#  confirm_token   :string(255)
#  confirm_at      :datetime
#  reset_send_at   :datetime
#  reset_token     :string(255)
#  manager_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ApplicationRecord
  has_secure_password

  # ================Association=====================

  # setup self_join for table admin.
  # we can retieve @admin.partner and @admin.manager
  has_many :partner, class_name: 'Admin', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Admin', optional: true

  has_many :shops

  # ================ENUMS=====================

  enum role: %w[admin manager partner]
  enum gender: %w[male female other]

  # ================Validates=====================
end
