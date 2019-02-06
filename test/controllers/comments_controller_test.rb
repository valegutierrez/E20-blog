require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

  test "admin should delete others comments" do
    current_user = users(:three)
    sign_in(current_user)
    @post = posts(:one)
    assert_difference('@post.comments.count', -1) do
      delete post_comment_path(@post, comments(:one))
    end
    assert_redirected_to post_url
  end
end
