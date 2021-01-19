class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end


  def edit
    @article = Article.find(params[:id])
    redirect_to root_path if @article.user_id != current_user.id
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :memo, :place, :date, :image).merge(user_id: current_user.id)
  end

end
