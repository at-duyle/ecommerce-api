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

require 'rails_helper'

RSpec.describe Request, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
