require 'test_helper'

class CutsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get cuts_edit_url
    assert_response :success
  end

end
