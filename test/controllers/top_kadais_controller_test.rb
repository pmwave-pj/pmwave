require 'test_helper'

class TopKadaisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_kadais_index_url
    assert_response :success
  end

end
