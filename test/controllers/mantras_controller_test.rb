require "test_helper"

class MantrasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mantras_show_url
    assert_response :success
  end
  test "should get json" do
    get "#{mantras_show_url}.json"
    json_res = JSON.parse response.body
    assert(json_res["pokemon"]["name"])
  end
end
