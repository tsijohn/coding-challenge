class PostsController < ApplicationController
  before_action :post, only: [:show, :destroy]

  def index
    if params[:search].present?
      @posts = Post.search(params[:search])
    else
      # Return all `Post`
      @posts = Post.all.order("created_at DESC")
    end
  end

  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # Add a new `Post` to the database
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    # Show post
    @post = post
    @comments = @post.comments
    @comment = Comment.new
  end

  def destroy
    # Removes a Post from the database
    @post = post
    if @post.destroy
      redirect_to posts_url
    end
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
