class AddDateToAffirmations < ActiveRecord::Migration[7.1]
  def change
    add_column :affirmations, :date, :date
  end
end
