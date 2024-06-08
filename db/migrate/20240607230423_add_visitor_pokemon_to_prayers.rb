class AddVisitorPokemonToPrayers < ActiveRecord::Migration[7.1]
  def change
    add_reference :prayers, :visitor_pokemon, null: false, foreign_key: true
  end
end
