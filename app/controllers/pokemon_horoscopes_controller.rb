require 'net/http'

class PokemonHoroscopesController < ApplicationController
  def initialize
    super
    @uri = URI.parse("https://api.openai.com/v1/chat/completions")
  end

  def show
    ip = request&.remote_ip || "127.0.0.1"
    horoscope = PokemonHoroscope.find_by(
      date: Date.today,
      ip:
    )
    puts horoscope
    if horoscope
      @horoscope = horoscope
    else
      res = generate_horoscope
      puts res
      @horoscope = PokemonHoroscope.new(
        date: Date.today,
        ip:,
        name: res[:name],
        sprite: res[:sprite],
        body: res[:body],
        url: res[:url]
      )
      @horoscope.save
    end
    render json: @horoscope
  end

  def key
    ENV['PERSONAL_BLOG_KEY']
  end

  def pokemon(num = rand(500))
    poke_uri = "https://pokeapi.co/api/v2/pokemon/#{num}/"
    res = Net::HTTP.get(URI(poke_uri))
    JSON.parse res
  end

  def prompt(pokemon_name)
    req = Net::HTTP::Post.new(@uri)
    request_body = {
      "model": "gpt-3.5-turbo",
      "messages": [{
        "role": "user",
        "content": "write me a three sentence horoscope based on the pokemon #{pokemon_name}. Reference the pokemon's name in the response."
      }],
      "temperature": 0.7
    }
    req.body = request_body.to_json

    req["Content-Type"] = "application/json"
    req["Authorization"] = "Bearer #{ENV['PERSONAL_BLOG_KEY']}"
    http = Net::HTTP.new(@uri.hostname, @uri.port)
    http.use_ssl = true
    JSON.parse http.request(req).body
  end

  def generate_horoscope
    num = rand(500)
    poke = pokemon(num)

    ai_res = prompt(poke['name'])
    {
      name: poke['name'],
      body: ai_res["choices"].first["message"]["content"],
      sprite: poke['sprites']['front_default'],
      url: "https://pokeapi.co/api/v2/pokemon/#{num}/"
    }
  end
end
