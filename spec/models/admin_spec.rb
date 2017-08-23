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
#  available       :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
