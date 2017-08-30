class Sessions::SessionsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :gender, :name, :address, :description, :auth_token
end
