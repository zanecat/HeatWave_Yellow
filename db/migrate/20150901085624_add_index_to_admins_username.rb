class AddIndexToAdminsUsername < ActiveRecord::Migration
  def change
  	add_index :admins, :username, unique: true
  end
end
