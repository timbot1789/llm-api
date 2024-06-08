class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :url
      t.string :name
      t.string :sprite

      t.timestamps
    end
  end
end
