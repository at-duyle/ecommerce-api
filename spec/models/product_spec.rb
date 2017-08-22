# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  producer         :string(255)
#  price            :float(24)
#  quantity         :integer
#  description      :text(65535)
#  categorical_type :string(255)
#  categorical_id   :integer
#  shop_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
