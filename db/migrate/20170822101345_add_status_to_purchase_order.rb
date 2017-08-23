class AddStatusToPurchaseOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_orders, :available, :boolean, default: true
  end
end
