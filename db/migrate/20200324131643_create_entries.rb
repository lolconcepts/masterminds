class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reason, null: false, foreign_key: true
      t.string :timespent
      t.string :recording
      t.text :notes
      t.boolean :reviewed, default: false
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
