# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @category = categories(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user

    params = {
      post: {
        body: Faker::Lorem.word,
        category_id: @category.id,
        title: Faker::Lorem.sentence
      }
    }

    assert_difference('Post.count') do
      post posts_url, params:
    end

    assert_equal @user.id, Post.last.creator_id
    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
