class Admins::AdminsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :gender, :avatar, :role
end
