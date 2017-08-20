class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :producer
      t.float :price
      t.integer :quantity
      t.text :description
      t.references :sub_category # , foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
