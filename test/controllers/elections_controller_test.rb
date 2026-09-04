require "test_helper"

class ElectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get elections_new_url
    assert_response :success
  end
end
