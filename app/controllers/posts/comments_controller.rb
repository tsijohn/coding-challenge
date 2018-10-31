module Posts
  class CommentsController < ApplicationController
    def create
      @comment = post.comments.build(comment_params)
      @post = post
      respond_to do |format|
        if @comment.save 
          format.js
        end
      end
    end

    def edit
      @comment = Comment.find(params[:id])
      @post = @comment.post
      respond_to do |format|
        format.js #replaces comment div with comment edit div
      end
    end

    def update
      @comment = Comment.find(params[:id])
      @post = @comment.post

      respond_to do |format|
        if @comment.update(comment_params)
          format.js #replaces comment edit div with comment div
        end
      end
    end

    def destroy
      # Removes a Post from the database
      @comment = Comment.find(params[:id]).destroy
      respond_to do |format|
        if @comment.destroy
          format.js #removes comment div
        end
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def post
      @post ||= Post.find(params[:post_id])
    end
  end
end