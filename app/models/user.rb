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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :authentication_keys => [:login]

  has_many :articles, dependent: :destroy
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :favorited, source_type: 'Article'

  validates :role, presence: true
  validate  :validate_login
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, if: :email?
  validates :phone, length: { in: 7..20 }, numericality: { only_integer: true }, if: :phone?

  enum role: [:superadmin, :registered]

  after_initialize :set_default_role

  mount_uploader :picture, ImageArticleUploader

  attr_accessor :login

  def can_add_favorite?(article)
    !articles.exists?(id: article.id)
  end

  def email_required?
    false
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(phone) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  private

  def set_default_role
    self.role ||= :registered
  end

  def validate_login
    errors.add(:base, :phone_or_email_blank) if self.email.blank? && self.phone.blank?
  end
end
