class AddAttributesDeliveryOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :delivery_orders, :name, :string
    add_column :delivery_orders, :city, :string
    add_column :delivery_orders, :district, :string
    add_column :delivery_orders, :ward, :string
    add_column :delivery_orders, :address, :string
    add_column :delivery_orders, :phone, :string
  end
end
