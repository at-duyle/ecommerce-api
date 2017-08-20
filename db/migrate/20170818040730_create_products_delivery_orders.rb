class CreateProductsDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :products_delivery_orders do |t|
      t.references :product, foreign_key: true
      t.references :delivery_order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
