class Sessions::SessionsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :gender, :name, :auth_token
end
