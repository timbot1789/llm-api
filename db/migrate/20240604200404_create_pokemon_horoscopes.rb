class CreatePokemonHoroscopes < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemon_horoscopes do |t|
      t.text :body
      t.string :url
      t.date :date

      t.timestamps
    end
  end
end
