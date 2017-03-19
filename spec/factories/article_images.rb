# == Schema Information
#
# Table name: article_images
#
#  id              :integer          not null, primary key
#  article_id      :integer          not null
#  image_file_name :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_article_images_on_article_id  (article_id)
#

FactoryGirl.define do
  factory :article_image do
    image_file_name { Faker::Avatar.image }
    association :article, factory: :article
  end
end
