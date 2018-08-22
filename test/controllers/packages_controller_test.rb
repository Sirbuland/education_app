require 'test_helper'

class PackagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get packages_index_url
    assert_response :success
  end

  test "should get new" do
    get packages_new_url
    assert_response :success
  end

  test "should get edit" do
    get packages_edit_url
    assert_response :success
  end

end
