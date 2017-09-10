class Shops::ListShopsSerializer < ActiveModel::Serializer
  attributes :id, :name, :logo, :slug
end
