class AddTotalPriceForDeliveryOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_orders, :total_price, :float
  end
end
