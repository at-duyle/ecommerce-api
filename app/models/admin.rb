# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  username               :string
#  encrypted_password     :string           default(""), not null
#  email                  :string
#  name                   :string
#  gender                 :integer
#  role                   :integer
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  manager_id             :integer
#  shop_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  available              :boolean          default(TRUE)
#

class Admin < ApplicationRecord

  # ================Association=====================

  # setup self_join for table admin.
  # we can retieve @admin.partner and @admin.manager
  has_many :partner, class_name: 'Admin', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Admin', optional: true

  belongs_to :shops

  # ================ENUMS=====================

  enum role: %w[admin manager partner]
  enum gender: %w[male female other]

  # ================Validates=====================
end
