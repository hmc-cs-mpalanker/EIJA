require 'test_helper'

class PlaysControllerTest < ActionDispatch::IntegrationTest
  test "should get hamlet" do
    get plays_hamlet_url
    assert_response :success
  end

end
