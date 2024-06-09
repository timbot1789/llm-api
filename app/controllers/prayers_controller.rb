class PrayersController < ApplicationController
  include Catchable
  include Promptable

  def self.make_prompt(pokemon_name)
    "Create a prayer of thanksgiving based on the pokemon #{pokemon_name}"
  end

  def self.model
   Prayer 
  end
end
