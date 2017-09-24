class AddTotalPricePurchase < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_orders, :total_price, :float
  end
end
