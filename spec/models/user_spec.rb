# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
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
#  phone                  :string           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do

  context 'db' do
    context 'columns' do
      it { should have_db_column(:email).of_type(:string).with_options(default: "", null: false) }
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
      it { should have_db_column(:phone).of_type(:string).with_options(null: false) }
    end

    context 'indexes' do
      it { should have_db_index(:email).unique(true) }
      it { should have_db_index(:reset_password_token).unique(true) }
    end
  end

  context 'associations' do
    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:articles).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should define_enum_for(:role).with([:superadmin, :registered]) }
    it { should validate_presence_of(:phone) }
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
end
