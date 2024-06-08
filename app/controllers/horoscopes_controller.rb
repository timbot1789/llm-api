require 'net/http'

class HoroscopesController < ApplicationController
  def self.make_prompt(pokemon_name)
     "write me a three sentence horoscope based on the pokemon #{pokemon_name}. Reference the pokemon's name in the response."
  end

  def show
    ip = request&.remote_ip || "127.0.0.1"
    horoscope = Horoscope.find_by(
      date: Date.today,
      ip:
    )
    if horoscope
      @horoscope = horoscope
    else
      res = generate_horoscope
      puts res
      @horoscope = Horoscope.new(
        date: Date.today,
        ip:,
        name: res[:name],
        sprite: res[:sprite],
        body: res[:body],
        url: res[:url]
      )
      @horoscope.save
    end
    respond_to do |format|
      format.html
      format.json { render json: @horoscope }
    end
  end

  def generate_horoscope
    num = rand(500)
    poke = pokemon(num)

    ai_res = prompt(poke['name'])
    {
      name: poke['name'],
      body: ai_res["choices"].first["message"]["content"],
      sprite: poke['sprites']['other']['official-artwork']['front_default'],
      url: "https://pokeapi.co/api/v2/pokemon/#{num}/"
    }
  end
end
