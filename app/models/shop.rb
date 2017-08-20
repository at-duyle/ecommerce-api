class Shop < ApplicationRecord
  belongs_to :admin
  has_many :products
end
