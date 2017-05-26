module ArticlesHelper
  def display_article_user(user)
    if user.name.present?
      user.name
    elsif user.email.present?
      display_email(user)
    else
      display_phone(user)
    end
  end

  def display_phone(user)
    user_signed_in? ? user.phone : user.phone.sub(/^.../, '*****')
  end

  def display_email(user)
    user_signed_in? ? user.email : user.email.split('@')[0]
  end
end
