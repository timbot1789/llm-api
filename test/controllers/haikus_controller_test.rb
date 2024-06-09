require "test_helper"

class HaikusControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get show" do
    get haikus_show_url
    assert_response :success
  end
  test "should get json" do
    get "#{haikus_show_url}.json"
    json_res = JSON.parse response.body
    assert(json_res["pokemon"]["name"])
  end
end
