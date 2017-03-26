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
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#


class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :favorites, as: :favorited, dependent: :destroy
  has_many :article_images, dependent: :destroy

  validates :name, :description, :offer_type, :location, :user, presence: true
  validates_length_of :name, maximum: 100

  enum offer_type: [:gift, :want, :barter]
  enum status: [:reserved, :available]

  scope :pusblish_articles, -> (user) { where.not(user: user) }

  mount_uploader :photo, ImageArticleUploader

  after_initialize :default_values

  accepts_nested_attributes_for :article_images, reject_if: :all_blank, allow_destroy: true

  def image_main
    article_images&.first
  end

  def total_images
    images_number = self.article_images.count
    (5 - images_number).times { self.article_images.build }
  end

  private

  def default_values
    self.status ||= Article.statuses[:available]
  end
end
