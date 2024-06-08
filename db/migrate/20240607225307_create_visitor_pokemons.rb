class CreateVisitorPokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :visitor_pokemons do |t|
      t.date :date
      t.references :visitor, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
