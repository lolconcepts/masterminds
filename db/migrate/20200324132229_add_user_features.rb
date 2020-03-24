class AddUserFeatures < ActiveRecord::Migration[6.0]
  def up
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :hours, :decimal, precision: 5, scale: 2, default:0.00
  end
  def down
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  	remove_column :users, :hours
  end
end
