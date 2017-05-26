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
# Foreign Keys
#
#  fk_rails_95824e00d3  (article_id => articles.id)
#


FactoryGirl.define do
  factory :article_image do
    image_file_name {  File.open(File.join(Rails.root, 'public', 'images', 'cover.png')) }
    association :article, factory: :article
  end
end
