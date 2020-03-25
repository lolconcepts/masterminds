class AddSessionDateToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :session_date, :datetime
  end
end
