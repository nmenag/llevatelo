# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :text             not null
#  location    :string           not null
#  status      :integer
#  offer_type  :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  photo       :string
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#



FactoryGirl.define do
  factory :article do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    location { Faker::Address.city }
    offer_type { Article.offer_types[:gift] }
    association :user, factory: :user
    association :category, factory: :category
  end
end
