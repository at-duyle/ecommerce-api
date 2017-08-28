class Products::ProductDeliveryOrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :producer, :price, :slug
end
