class Products::ProductCartSerializer < ActiveModel::Serializer
  attributes :slug, :quantity, :message
end
