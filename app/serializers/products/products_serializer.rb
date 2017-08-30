class Products::ProductsSerializer < ActiveModel::Serializer
  attributes :id, :name, :producer, :price, :quantity, :description, :shop_id, :slug
  has_many :images, serializer: Images::ImagesSerializer
end
