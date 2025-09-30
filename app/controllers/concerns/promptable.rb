require 'net/http'

# Controllers using this concern are able to prompt AI models
#
module Promptable
  extend ActiveSupport::Concern
  included do
    def prompt(pokemon_name)
      res = ApplicationAgent.with(message: self.class.make_prompt(pokemon_name)).prompt_context.generate_now
      res.message.content
    end
  end
end
