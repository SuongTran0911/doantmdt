require 'test_helper'

class EditAccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get edit_account_index_url
    assert_response :success
  end

end
