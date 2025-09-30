class MantrasController < ApplicationController
  include Catchable
  include Promptable

  def self.make_prompt(pokemon_name)
    "create an 8 word, 1 clause buddhist mantra based off the pokemon #{pokemon_name}. Do not mention the name of the pokemon in the response. Do not add anything other than the mantra."
  end

  def self.model
    Mantra
  end
end
