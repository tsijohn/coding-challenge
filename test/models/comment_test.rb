require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'invalid without post' do
    comment = Comment.new(body: 'Hello! Hello!')
    refute comment.valid?
    assert_not_nil comment.errors[:post]
  end
end
