# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :text             not null
#  location    :string           not null
#  status      :boolean          default(FALSE), not null
#  type        :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :article do
    
  end
end
