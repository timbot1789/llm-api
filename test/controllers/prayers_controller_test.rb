require "test_helper"

class PrayersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get prayers_show_url
    assert_response :success
  end
  test "should get json" do
    get "#{prayers_show_url}.json"
    json_res = JSON.parse response.body
    assert(json_res["pokemon"]["name"])
  end
end
