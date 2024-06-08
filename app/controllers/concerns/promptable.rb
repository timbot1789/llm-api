require 'net/http'

# Controllers using this concern are able to prompt AI models
#
module Promptable
  extend ActiveSupport::Concern
  included do
    def ai_uri
      URI.parse("https://api.openai.com/v1/chat/completions")
    end

    def prompt(pokemon_name)
      req = Net::HTTP::Post.new(ai_uri)
      request_body = {
        "model": "gpt-3.5-turbo",
        "messages": [{
          "role": "user",
          "content": self.class.make_prompt(pokemon_name)
        }],
        "temperature": 0.7
      }
      req.body = request_body.to_json

      req["Content-Type"] = "application/json"
      req["Authorization"] = "Bearer #{ENV['PERSONAL_BLOG_KEY']}"
      http = Net::HTTP.new(ai_uri.hostname, ai_uri.port)
      http.use_ssl = true
      res = JSON.parse http.request(req).body
      res["choices"].first["message"]["content"]
    end
  end
end
