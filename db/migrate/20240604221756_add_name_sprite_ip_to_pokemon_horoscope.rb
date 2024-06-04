class AddNameSpriteIpToPokemonHoroscope < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemon_horoscopes, :name, :string
    add_column :pokemon_horoscopes, :sprite, :string
    add_column :pokemon_horoscopes, :ip, :string
  end
end
