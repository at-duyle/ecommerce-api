class DeliveryOrders::DeliveryOrdersSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :total_price
  has_many :products_delivery_orders,
           serializer: ProductsDeliveryOrder::ProductsDeliveryOrdersSerializer
end
