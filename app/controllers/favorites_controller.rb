class FavoritesController < ApplicationController
  before_action :set_article, except: [:my_favorites]

  def create
    if Favorite.create(favorited: @article, user: current_user)
      redirect_to @article, notice: 'El articulo ha sido agregado a favoritos'
    else
      redirect_to @article, alert: 'Hubo un error, por favor intenta mas tarde'
    end
  end

  def destroy
    Favorite.where(favorited_id: @article.id, user_id: current_user.id).first.destroy
    redirect_to @article, notice: 'El articulo ha sido removido de los favoritos'
  end

  def my_favorites
    @favorites = current_user.favorite_articles
  end

  private

  def set_article
    @article = Article.find(params[:article_id] || params[:id])
  end
end
