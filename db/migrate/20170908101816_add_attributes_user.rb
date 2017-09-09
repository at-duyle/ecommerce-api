class AddAttributesUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :ward, :string
  end
end
