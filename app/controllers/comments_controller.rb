class CommentsController < ApplicationController
	def create
    @post = Article.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to article_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
