# == Schema Information
#
# Table name: article_images
#
#  id              :integer          not null, primary key
#  article_id      :integer
#  image_file_name :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_article_images_on_article_id  (article_id)
#

class ArticleImage < ApplicationRecord
  belongs_to :article, required: false

  validates :image_file_name, presence: true

  mount_uploader :image_file_name, ImageArticleUploader
end
