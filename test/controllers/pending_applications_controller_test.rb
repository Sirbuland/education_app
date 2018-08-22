require 'test_helper'

class PendingApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pending_applications_index_url
    assert_response :success
  end

end
