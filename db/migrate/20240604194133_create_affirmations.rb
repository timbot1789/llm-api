class CreateAffirmations < ActiveRecord::Migration[7.1]
  def change
    create_table :affirmations do |t|
      t.text :body

      t.timestamps
    end
  end
end
