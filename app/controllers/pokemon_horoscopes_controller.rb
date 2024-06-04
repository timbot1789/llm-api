class PokemonHoroscopesController < ApplicationController
  @uri = URI.parse("https://api.openai.com/v1/chat/completions")

  def show
  end

  def generate_pokemon
    poke_uri = "https://pokeapi.co/api/v2/pokemon/#{rand(365)}/"
    res = Net::HTTP.get(URI(poke_uri))
    JSON.parse res
  end

  def prompt
    req = Net::HTTP::Post.new(@uri)

    request_body = {
      "model": "gpt-3.5-turbo",
      "messages": [{
        "role": "user",
        "content": request.body.read
      }],
      "temperature": 0.7
    }
    req.body = request_body.to_json

    req["Content-Type"] = "application/json"
    req["Authorization"] = "Bearer #{ENV['PERSONAL_BLOG_KEY']}"
    http = Net::HTTP.new(@uri.hostname, @uri.port)
    http.use_ssl = true

    render json: http.request(req).body
  end
end
