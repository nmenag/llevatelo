class LandingController < ApplicationController
  layout 'landing'

  def index
    @articles = Article.pusblish_articles(current_user).limit(8)
  end
end
