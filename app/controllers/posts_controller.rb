class PostsController < ApplicationController
  def index
    # Return all `Post`
    @posts = Post.all
  end

  def new
    # Return view to create a new Post
  end

  def create
    # Add a new `Post` to the database
  end

  def destroy
    # Remove a `Post` from the database
  end
end
