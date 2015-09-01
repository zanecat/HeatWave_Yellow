class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :email
      t.boolean :email_enabled
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
