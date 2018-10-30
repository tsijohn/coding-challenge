class PostsController < ApplicationController
  def index
    # Return all `Post`
    @posts = Post.all
  end

  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # Add a new `Post` to the database
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    # Remove a `Post` from the database
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
