class AddVisitorPokemonToMantras < ActiveRecord::Migration[7.1]
  def change
    add_reference :mantras, :visitor_pokemon, null: false, foreign_key: true
  end
end
