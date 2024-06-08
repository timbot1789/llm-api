class HaikusController < ApplicationController
  include Catchable
  include Promptable

  def self.make_prompt(pokemon_name)
    "write a haiku based on the pokemon #{pokemon_name}"
  end

  def self.model
    Haiku
  end
end
