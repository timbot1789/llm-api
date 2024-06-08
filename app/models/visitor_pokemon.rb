class VisitorPokemon < ApplicationRecord
  belongs_to :visitor
  belongs_to :pokemon
  has_one :horoscope
  has_one :mantra
  has_one :prayer
  has_one :affirmation
end
