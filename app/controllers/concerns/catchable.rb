# Controllers that implement this concern are able to "catch" pokemon;
# i.e. generate new pokemon for the visitor if the visitor hasn't gotten one yet
module Catchable
  extend ActiveSupport::Concern
  included do
    def catch_pokemon(num = rand(500))
      JSON.parse Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{num}/"))
    end
  end
end
