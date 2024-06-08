class Visitor < ApplicationRecord
  has_many :visitor_pokemons
  has_many :pokemon, through: :visitor_pokemons
end
