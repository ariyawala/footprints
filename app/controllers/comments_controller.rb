class CommentsController < ApplicationController
  def create
    @article = Article.find_by(id: params[:article_id])
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to "/articles/#{@comment.article.id}"
    else
      redirect_to article_path(@article.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
