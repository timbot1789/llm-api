class Pokemon < ApplicationRecord
  has_many :visitor_pokemons
  has_many :visitors, through: :visitor_pokemons
end
