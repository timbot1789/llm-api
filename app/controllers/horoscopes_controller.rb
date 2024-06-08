
class HoroscopesController < ApplicationController
  include Catchable
  include Promptable

  def self.make_prompt(pokemon_name)
     "write me a three sentence horoscope based on the pokemon #{pokemon_name}. Reference the pokemon's name in the response."
  end

  def show
    visitor_pokemon = get_visitor_pokemon
    horoscope = Horoscope.find_by visitor_pokemon_id: visitor_pokemon.id
    if horoscope
      @horoscope = horoscope
    else
      body = prompt visitor_pokemon.pokemon.name 
      @horoscope = Horoscope.create(visitor_pokemon:, body:) 
    end
    respond_to do |format|
      format.html
      format.json { render json: @horoscope }
    end
  end
end
