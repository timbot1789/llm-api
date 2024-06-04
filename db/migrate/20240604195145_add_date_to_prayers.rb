class AddDateToPrayers < ActiveRecord::Migration[7.1]
  def change
    add_column :prayers, :date, :date
  end
end
