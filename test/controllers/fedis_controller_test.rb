require "test_helper"

class FedisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fedis_index_url
    assert_response :success
  end
end
