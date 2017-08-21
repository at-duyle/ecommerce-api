class Users::CurrentUserSerializer < ActiveModel::Serializer
  attributes :username, :email, :name, :gender, :avatar
end
