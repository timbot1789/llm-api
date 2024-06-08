# Connects models to a pokemon and a person
module Pokeball
  extend ActiveSupport::Concern
  included do
    belongs_to :visitor_pokemon
    delegate :visitor, to: :visitor_pokemon, allow_nil: false
    delegate :pokemon, to: :visitor_pokemon, allow_nil: false
  end
end
