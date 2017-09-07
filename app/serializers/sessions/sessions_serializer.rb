class Sessions::SessionsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :gender, :name, :address, :description, :auth_token
  has_one :cart, serializer: Carts::CartSerializer
end
