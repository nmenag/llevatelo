class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only:[:show, :edit, :contact, :update]

  def index
    @articles = Article.pusblish_articles
  end

  def my_articles
    @gifts = current_user.articles.find_all { |a| a.gift? }
    @barters = current_user.articles.find_all { |a| a.barter? }
  end

  def show
    @articles = Article.friendly.find(params[:id])
  end

  def new
    @article = Article.new
    5.times { @article.article_images.build }
    render :form
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      flash[:notice] = "Se ha agregado un nuevo articulo"
      redirect_to my_articles_path
    else
      flash[:notice] = @article.errors.full_messages.first
      5.times { @article.article_images.build }
      render 'form'
    end
  end

  def edit
    @article.total_images
    render :form
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Se ha modificado el  articulo #{@article.name}"
      redirect_to my_articles_path
    else
      flash[:notice] = @article.errors.full_messages.first
      @article.total_images
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

  def contact
    ArticlesMailer.contact(@article, current_user).deliver_now
  end


  private
  def article_params
    params.require(:article).permit(
      :name, :offer_type, :description, :status, :photo, :location,
      article_images_attributes:[:id, :image_file_name, :_destroy]
    )
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
