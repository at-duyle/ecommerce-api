class ProductsDeliveryOrder::ProductsDeliveryOrdersSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  belongs_to :product, serializer: Products::ProductDeliveryOrderSerializer
end
