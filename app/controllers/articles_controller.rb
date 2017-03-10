class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def my_articles
    @gifts = current_user.articles.find_all{|a| a.gift? }
    @wants = current_user.articles.find_all{|a| a.want? }
    @barters = current_user.articles.find_all{|a| a.barter? }
  end

  def show
    @article  = Article.find(params[:id])
  end

  def new
    @article = Article.new
    render :form
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:notice] = "Se ha agregado un nuevo articulo"
      redirect_to my_articles_path
    else
      render :form
    end
  end

  def edit
    @article = Article.find(params[:id])
    render :form
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Se ha modificado el  articulo #{@article.name}"
      redirect_to my_articles_path
    else
      render :form
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Se ha eliminado el  articulo #{@article.name}"
    else
      flash[:notice] = "no se pudo eliminar articulo #{@article.name}"
    end

    redirect_to my_articles_path
  end

  private
  def article_params
    params.require(:article).permit(:name, :offer_type, :description, :status, :photo)
  end
end
