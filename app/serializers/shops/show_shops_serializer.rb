class Shops::ShowShopsSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number, :latitude, :longitude, :logo
  has_one :admin, serializer: Admins::AdminsSerializer
end
