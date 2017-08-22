class AddStatusToDeliveryOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_orders, :status, :integer, default: 0
  end
end
