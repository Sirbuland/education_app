require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get students_edit_url
    assert_response :success
  end

end
