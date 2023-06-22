require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should create comment" do
    assert_difference("Comment.count") do
      post comments_url, params: { comment: { content: @comment.content, post_id: @comment.post_id, user_id: @comment.user_id } }
    end

    assert_redirected_to comment_url(Comment.last)
  end
end
