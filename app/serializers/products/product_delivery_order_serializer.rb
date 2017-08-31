class Products::ProductDeliveryOrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :producer, :price
  has_one :image, serializer: Images::ImagesSerializer
end
