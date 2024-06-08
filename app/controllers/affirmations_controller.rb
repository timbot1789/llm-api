class AffirmationsController < ApplicationController
  include Catchable
  include Promptable

  def self.make_prompt(pokemon_name)
    "create a 1 sentence positive daily affirmation based off the pokemon #{pokemon_name}. Do not mention the name of the pokemon in the response."
  end

  def self.model
    Affirmation
  end
end
