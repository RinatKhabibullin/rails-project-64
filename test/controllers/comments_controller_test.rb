# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @second_user = users(:two)
    sign_in @user

    @post = posts(:one)
    @comment = post_comments(:one)
  end

  test 'should create comment' do
    params = {
      post_comment: {
        content: Faker::Lorem.sentence,
        creator_id: @second_user.id
      }
    }

    assert_difference('PostComment.count') do
      post post_comments_url(post_id: @post.id), params:
    end

    assert_redirected_to post_url(@post)
  end

  test 'should create nested comment' do
    params = {
      post_comment: {
        content: Faker::Lorem.sentence,
        creator_id: @user.id,
        parent_id: @comment.id
      }
    }

    assert_difference('PostComment.count') do
      post post_comments_url(post_id: @post.id), params:
    end

    assert_equal @comment.id.to_s, PostComment.last.ancestry
    assert_redirected_to post_url(@post)
  end
end
