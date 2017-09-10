class Admins::AdminsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :name
  has_many :partner, serializer: Admins::PartnersSerializer
end
