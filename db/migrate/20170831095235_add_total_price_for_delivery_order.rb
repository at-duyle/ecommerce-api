class AddTotalPriceForDeliveryOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_orders, :total_price, :float, default: 5000000
  end
end
