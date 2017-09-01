class Admins::PartnersSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :gender, :role
end
