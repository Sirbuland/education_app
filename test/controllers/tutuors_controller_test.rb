require 'test_helper'

class TutuorsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get tutuors_edit_url
    assert_response :success
  end

end
