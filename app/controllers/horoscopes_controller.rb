class HoroscopesController < ApplicationController
  include Catchable
  include Promptable

  def self.make_prompt(pokemon_name)
    "write me a three sentence horoscope based on the pokemon #{pokemon_name}. Reference the pokemon's name in the response."
  end

  def self.model
    Horoscope
  end
end
