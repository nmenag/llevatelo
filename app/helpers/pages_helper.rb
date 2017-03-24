module PagesHelper
  def display_image_article(article, version_name = nil)
    if article.image_main.present?
      image_tag(article.image_main.image_file_name)
    else
      image_tag("/images/" + [version_name, "cover.png"].compact.join('_'))
    end
  end
end
