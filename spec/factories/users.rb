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
#  name                   :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#


FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'llevatelo123' }
    password_confirmation { 'llevatelo123' }
    role { User.roles[:registered] }
    phone { Faker::Number.number(10) }
    confirmed_at { Date.today }
  end
end
