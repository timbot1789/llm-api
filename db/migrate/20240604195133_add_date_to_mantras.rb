class AddDateToMantras < ActiveRecord::Migration[7.1]
  def change
    add_column :mantras, :date, :date
  end
end
