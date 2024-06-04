require "test_helper"

class PokemonHoroscopesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get pokemon_horoscopes_show_url
    assert_response :success
  end
end
