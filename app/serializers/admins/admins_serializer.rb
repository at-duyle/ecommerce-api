class Admins::AdminsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :gender, :role
end
