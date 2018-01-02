class ArticlesMailer < ApplicationMailer
  def contact(article, user)
    @user_interesed = user
    @user = article.user
    mail(to: @user.email,  subject: 'Alguien esta interesado por el producto publicado en llevatelo.co')
  end
end
