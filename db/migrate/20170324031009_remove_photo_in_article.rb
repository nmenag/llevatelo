class RemovePhotoInArticle < ActiveRecord::Migration[5.0]
  def change
    if ActiveRecord::Base.connection.column_exists?(:articles, :photo)
      Article.where.not(photo: nil).each do |article|
        article_image = article.article_images.new
        article_image.remote_image_file_name_url = article.photo.url
        article_image.save
      end
    end

    remove_column :articles, :photo, :string
  end
end
