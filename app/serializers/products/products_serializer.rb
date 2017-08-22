class Products::ProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :producer, :price, :quantity, :description, :categorical_type, :categorical_id, :shop_id, :slug
end
