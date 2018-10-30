require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post delete also deletes all the comments" do
    post = posts(:test_post_with_comment)
    post.destroy
    assert_equal 0, post.comments.count
  end
end
