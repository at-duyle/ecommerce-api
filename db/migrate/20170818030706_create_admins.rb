class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :encrypted_password, null: false, default: ""
      t.string :email
      t.string :name
      t.integer :gender
      t.integer :role
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.references :manager, index: true
      t.references :shop, foreign_key: true

      t.timestamps
    end

    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
  end
end
