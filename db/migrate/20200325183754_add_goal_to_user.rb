class AddGoalToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :goal,:decimal, precision: 5, scale: 2, default:50.00
  end
end
