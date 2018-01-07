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

require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:favorited_type).of_type(:string) }
    end

    context 'indexes' do
      it { should have_db_index(:user_id) }
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:favorited) }
  end

  context 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:favorited) }
  end

  it 'has a valid factory' do
    expect(build(:favorite)).to be_valid
  end
end
