require 'net/http'

# Controllers that implement this concern are able to "catch" pokemon;
# i.e. generate new pokemon for the visitor if the visitor hasn't gotten one yet
module Catchable
  extend ActiveSupport::Concern
  included do
    def catch_pokemon(num = rand(500))
      res = JSON.parse Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{num}/"))
      res["url"] = "https://pokeapi.co/api/v2/pokemon/#{num}/"
      res
    end

    def get_visitor_pokemon
      ip = request&.remote_ip || "127.0.0.1"
      visitor = Visitor.find_by(ip:)
      visitor = Visitor.create(ip:) unless visitor 
      join = VisitorPokemon.find_by(visitor:, date: Date.today)
      unless join
        res = catch_pokemon
        pokemon = Pokemon.create(
          name: res["name"],
          sprite: res["sprites"]["other"]["official-artwork"]["front_default"],
          url: res["url"]
        )
        join = VisitorPokemon.create(visitor:, pokemon:, date: Date.today)
      end
      join
    end
  end
end
