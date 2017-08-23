class AddStatusToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :available, :boolean, default: true
  end
end
