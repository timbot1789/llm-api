class CreatePrayers < ActiveRecord::Migration[7.1]
  def change
    create_table :prayers do |t|
      t.text :body

      t.timestamps
    end
  end
end
