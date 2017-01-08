require 'test_helper'

class WriteBlogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get write_blog_index_url
    assert_response :success
  end

end
