require 'test_helper'

class OtherPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get other_posts_new_url
    assert_response :success
  end

  test "should get edit" do
    get other_posts_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get other_posts_confirm_url
    assert_response :success
  end

end
