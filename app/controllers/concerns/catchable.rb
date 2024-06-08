# Controllers that implement this concern are able to "catch" pokemon;
# i.e. generate new pokemon for the visitor if the visitor hasn't gotten one yet
module Catchable
  extend ActiveSupport::Concern
  included do
    def pokemon(num = rand(500))
      poke_uri = "https://pokeapi.co/api/v2/pokemon/#{num}/"
      res = Net::HTTP.get(URI(poke_uri))
      JSON.parse res
    end
  end
end
