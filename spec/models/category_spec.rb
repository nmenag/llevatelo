# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  status     :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'db' do
    context 'columns' do
      it { should have_db_column(:name).of_type(:string).with_options(null: false) }
      it { should have_db_column(:status).of_type(:boolean).with_options(default: false, null: false) }
    end
  end

  context 'associations' do
    it { should have_many(:articles) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end
end
