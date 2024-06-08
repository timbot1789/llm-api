class AddVisitorPokemonToAffirmations < ActiveRecord::Migration[7.1]
  def change
    add_reference :affirmations, :visitor_pokemon, null: false, foreign_key: true
  end
end
