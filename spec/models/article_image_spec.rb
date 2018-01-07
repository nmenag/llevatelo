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
#  fk_rails_...  (article_id => articles.id)
#

require 'rails_helper'

RSpec.describe ArticleImage, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:image_file_name).of_type(:string).with_options(null: false) }
    end

    context 'indexes' do
      it { should have_db_index(:article_id) }
    end
  end

  context 'associations' do
    it { should belong_to(:article) }
  end

  context 'validations' do
    it { should validate_presence_of(:image_file_name) }
  end

  it 'has a valid factory' do
    expect(build(:article_image)).to be_valid
  end
end
