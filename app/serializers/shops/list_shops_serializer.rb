class Shops::ListShopsSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone_number, :latitude, :longitude, :admin_id
end
