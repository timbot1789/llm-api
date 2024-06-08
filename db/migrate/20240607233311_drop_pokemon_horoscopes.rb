class DropPokemonHoroscopes < ActiveRecord::Migration[7.1]
  def up 
    drop_table :pokemon_horoscopes 
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
