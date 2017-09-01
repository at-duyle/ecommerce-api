class Admins::AdminsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name, :gender, :role
  has_many :partner, serializer: Admins::PartnersSerializer
end
