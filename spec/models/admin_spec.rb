# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  email           :string
#  name            :string
#  gender          :integer
#  role            :integer          default("partner")
#  auth_token      :string
#  confirm_send_at :datetime
#  confirm_token   :string
#  confirm_at      :datetime
#  reset_send_at   :datetime
#  reset_token     :string
#  manager_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  available       :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Admin, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
