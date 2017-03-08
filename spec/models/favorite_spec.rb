# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  article_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_favorites_on_article_id  (article_id)
#  index_favorites_on_user_id     (user_id)
#




require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context 'db' do
    context 'indexes' do
      it { should have_db_index(:article_id) }
      it { should have_db_index(:user_id) }
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  context 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:article) }
  end

  it 'has a valid factory' do
    expect(build(:favorite)).to be_valid
  end
end
