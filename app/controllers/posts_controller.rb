class PostsController < ApplicationController
  def index
    # Return all `Post`
    @posts = Post.all
  end

  def new
    # Return view to create a new Post
    @post = Post.new
    @comment = Comment.new
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

  def show
    # Show post
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def destroy
    # Removes a Post from the database
    Post.find(params[:id]).destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
