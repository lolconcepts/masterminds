class AddCarrierToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :carrier, null: false, foreign_key: true, default: 1
    add_column :users, :smsok, :boolean, default: false
    add_column :users, :mobile, :string
  end
end
