class Sessions::SessionsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :gender, :name, :address, :description,
             :city, :district, :ward, :auth_token
  has_one :cart, serializer: Carts::CartSerializer
end
