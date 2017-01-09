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
end
