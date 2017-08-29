class Shops::ShowShopsSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number, :latitude, :longitude
  belongs_to :admin, serializer: Admins::AdminsSerializer
end
