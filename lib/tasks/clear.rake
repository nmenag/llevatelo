namespace :clear do
  desc 'disabled all articles after 90 days'

  task disable_articles_90_days: :environment  do
    Article.pusblish_articles.each do |article|
      #TODO send email to user of article notice the disabled of his article
      article.disabled! if article.updated_at < (Date.today - 90.days)
    end
  end
end
