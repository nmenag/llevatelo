# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  status                 :boolean          default(FALSE), not null
#  role                   :integer          not null
#  phone                  :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  picture                :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  context 'db' do
    context 'columns' do
      it { should have_db_column(:email).of_type(:string).with_options(default: "") }
      it { should have_db_column(:encrypted_password).of_type(:string).with_options(default: "", null: false) }
      it { should have_db_column(:reset_password_token).of_type(:string) }
      it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
      it { should have_db_column(:remember_created_at).of_type(:datetime) }
      it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
      it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
      it { should have_db_column(:current_sign_in_ip).of_type(:string) }
      it { should have_db_column(:last_sign_in_ip).of_type(:string) }
      it { should have_db_column(:status).of_type(:boolean).with_options(default: false, null: false) }
      it { should have_db_column(:role).of_type(:integer).with_options(null: false) }
      it { should have_db_column(:phone).of_type(:string) }
      it { should validate_numericality_of(:phone).only_integer }
      it { should validate_length_of(:phone).is_at_least(7) }
      it { should validate_length_of(:phone).is_at_most(20) }
      it { should have_db_column(:picture).of_type(:string) }
    end

    context 'indexes' do
      it { should have_db_index(:email).unique(true) }
      it { should have_db_index(:reset_password_token).unique(true) }
    end
  end

  context 'associations' do
    it { should have_many(:favorites) }
    it { should have_many(:articles).dependent(:destroy) }
    it { should have_many(:favorite_articles).through(:favorites).source(:favorited) }
  end

  context 'validations' do
    it { should validate_presence_of(:role) }
    it { should define_enum_for(:role).with([:superadmin, :registered]) }
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'set_default_role' do
    it 'should be initialized with role registered' do
      user = User.new
      expect(user.registered?).to eq true
    end
  end

  describe 'when is phone and email is empty' do
    it 'has invalid factory' do
      expect(build(:user, email: nil, phone: nil)).not_to be_valid
    end
  end

  describe 'when is email present' do
    it 'has valid factory without phone' do
      expect(build(:user, phone: nil)).to be_valid
    end

    it 'has invalid factory without email format' do
      expect(build(:user, phone: nil, email: 'example')).not_to be_valid
    end
  end

  describe 'when is phone present' do
    it 'has valid factory without email' do
      expect(build(:user, email: nil)).to be_valid
    end

    it 'has invalid factory' do
      expect(build(:user, email: nil, phone: '1234')).not_to be_valid
    end
  end


end
