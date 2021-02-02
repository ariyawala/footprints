class IinesController < ApplicationController

  def create
    # @article = Article.find(params[:id])
    @iine = current_user.iines.build(iine_params)
    @article = @iine.article
    if @iine.save
      redirect_to "/articles/#{@iine.article.id}"
    end
  end

  def destroy
    @iine = Iine.find_by(id: params[:id])
    @article = @iine.article
    if @iine.destroy
      redirect_to "/articles/#{@iine.article.id}"
    end
  end

  private

  def iine_params
    params.permit(:article_id)
  end

end
