require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
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
