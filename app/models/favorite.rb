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
#  fk_rails_...  (user_id => users.id)
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  validates :user, :favorited, presence: true
end
