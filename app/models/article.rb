# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  name        :string(100)      not null
#  description :text             not null
#  location    :string           not null
#  status      :integer
#  offer_type  :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  slug        :string
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug) UNIQUE
#  index_articles_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :category, optional: true
  has_many :favorites, as: :favorited, dependent: :destroy
  has_many :article_images, dependent: :destroy

  validates :name, :description, :offer_type, :location, :user, presence: true
  validates_length_of :name, maximum: 100

  enum offer_type: [:gift, :barter]
  enum status: [:reserved, :available, :disabled]

  scope :pusblish_articles, -> { where(status: :available) }

  after_initialize :default_values

  accepts_nested_attributes_for :article_images, reject_if: :all_blank, allow_destroy: true

  def image_main
    article_images&.first
  end

  def image_main_url
    image_main.image_file_name.url
  end

  def total_images
    images_number = self.article_images.count
    (5 - images_number).times { self.article_images.build }
  end

  def user_email
    user.email
  end

  private

  def default_values
    self.status ||= Article.statuses[:available]
  end
end
