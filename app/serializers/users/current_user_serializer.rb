class Users::CurrentUserSerializer < ActiveModel::Serializer
  attributes :username, :email, :name, :gender, :auth_token, :slug
end
