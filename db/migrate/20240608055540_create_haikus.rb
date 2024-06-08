class CreateHaikus < ActiveRecord::Migration[7.1]
  def change
    create_table :haikus do |t|
      t.text :body
      t.references :visitor_pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
