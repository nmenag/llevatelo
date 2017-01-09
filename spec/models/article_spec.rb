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
#  category_id :integer
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#

require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string).with_options(null: false, limit: 100) }
      it { should have_db_column(:description).of_type(:text).with_options(null: false) }
      it { should have_db_column(:location).of_type(:string).with_options(null: false) }
      it { should have_db_column(:status).of_type(:boolean).with_options(default: false, null: false) }
      it { should have_db_column(:type).of_type(:integer).with_options(null: false) }
    end

    context 'indexes' do
      it { should have_db_index(:user_id) }
      it { should have_db_index(:category_id) }
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:favorites).dependent(:destroy) }
  end
end
