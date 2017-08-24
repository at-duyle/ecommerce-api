class Users::CurrentUserSerializer < ActiveModel::Serializer
  attributes :username, :email, :name, :gender, :avatar, :auth_token, :slug
end
