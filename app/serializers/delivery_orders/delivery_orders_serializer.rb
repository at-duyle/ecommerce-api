class DeliveryOrders::DeliveryOrdersSerializer < ActiveModel::Serializer
  attributes :id, :status
  has_many :products_delivery_orders,
           serializer: ProductsDeliveryOrder::ProductsDeliveryOrdersSerializer
end
