module PagesHelper
  def display_image_article(article, version_name = nil)
    if article.image_main.present?
      article.image_main.image_file_name.url
    else
      "/images/" + [version_name, "cover.png"].compact.join('_')
    end
  end
end
