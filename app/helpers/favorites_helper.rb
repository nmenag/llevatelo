module FavoritesHelper
  def favorited_button(article)
    if user_signed_in? && current_user.can_add_favorite?(article)
      if current_user.favorite_articles.exists?(id: @article.id)
        link_to '<i class="glyphicon glyphicon-heart size-32"></i>'.html_safe, favorite_path(@article), method: :delete, class: 'pull-right'
      else
        link_to '<i class="glyphicon glyphicon-heart-empty size-32"></i>'.html_safe, favorites_path(article_id: @article), method: :post, class: 'pull-right'
      end
    end
  end

end
