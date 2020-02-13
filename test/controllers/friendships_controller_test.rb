require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get my_friends" do
    get friendships_my_friends_url
    assert_response :success
  end

end
