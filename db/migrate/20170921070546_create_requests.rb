class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :shop_name
      t.string :shop_address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
