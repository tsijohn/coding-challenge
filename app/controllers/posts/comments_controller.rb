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

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def post
      @post ||= Post.find(params[:post_id])
    end
  end
end