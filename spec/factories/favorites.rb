# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  favorited_type :string
#  favorited_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_favorites_on_favorited_type_and_favorited_id  (favorited_type,favorited_id)
#  index_favorites_on_user_id                          (user_id)
#
# Foreign Keys
#
#  fk_rails_d15744e438  (user_id => users.id)
#

FactoryGirl.define do
  factory :favorite do
    association :user, factory: :user
    association :favorited, factory: :article
  end
end
