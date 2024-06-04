class CreateMantras < ActiveRecord::Migration[7.1]
  def change
    create_table :mantras do |t|
      t.text :body

      t.timestamps
    end
  end
end
