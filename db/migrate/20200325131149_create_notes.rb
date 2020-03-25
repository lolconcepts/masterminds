class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true, default: 1
      t.string :body

      t.timestamps
    end
  end
end
