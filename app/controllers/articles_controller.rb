class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:my_articles]

  def index
  end

  def my_articles
  end
end
