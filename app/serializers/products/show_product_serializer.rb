class Products::ShowProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :producer, :price, :quantity, :description, :slug
  has_many :images, serializer: Images::ImagesSerializer
  has_one :shop, serializer: Shops::ListShopsSerializer
  has_many :comments, serializer: Comments::CommentsSerializer
end
