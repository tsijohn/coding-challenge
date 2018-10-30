require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  fixtures :posts
  
  test 'should get index' do
    get posts_url
    assert_response :success
    #testing index action
  end 

  test "POST #create creates and returns new post" do
    assert_difference "Post.count" do
      post posts_path, params: create_post_params
    end
    assert_response :redirect
  end

  test "GET #show returns post" do
    get post_path(posts(:test_post))
    assert_response 200
  end

  test "DELETE #destroy deletes the post" do
    count = Post.all.count
    delete post_path(posts(:test_post))
    assert_response :redirect
    assert_equal count - 1, Post.all.count
  end

  private

  def create_post_params
    {
      post: {
        title: "Test Post",
        body: "Doing a create action test"
      }
    }
  end
end
