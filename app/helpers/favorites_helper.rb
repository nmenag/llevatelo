module FavoritesHelper
  def favorited_button(article)
    if user_signed_in? && current_user.can_add_favorite?(article)
      if current_user.favorite_articles.exists?(id: @article.id)
        link_to('<i class="fa fa-heart color-red"></i>'.html_safe, favorite_path(@article), method: :delete, class: 'btn btn-default', title: "Agregar a mis favoritos")
      else
        link_to('<i class="fa fa-heart-o"></i>'.html_safe, favorites_path(article_id: @article), method: :post, class: 'btn btn-default', title: "Agregar a mis favoritos")
      end
    end
  end
end
