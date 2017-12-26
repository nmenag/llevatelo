class LandingController < ApplicationController
  layout 'landing'

  def index
    @articles = Article.pusblish_articles.limit(8)
  end
end
