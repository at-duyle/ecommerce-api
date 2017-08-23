# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  address      :string(255)
#  phone_number :string(255)
#  latitude     :float(24)
#  longitude    :float(24)
#  admin_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  available    :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
