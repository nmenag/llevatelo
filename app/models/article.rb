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
#  photo       :string
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#



class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :favorites, dependent: :destroy

  validates :name, :description, :offer_type, :location, :user, presence: true
  validates_length_of :name, maximum: 100

  enum offer_type: [:gift, :want, :barter]

  enum status: [:reserved, :available]

  after_initialize :default_values

  private

  def default_values
    self.status ||= Article.statuses[:available]
    self.location ||= '0'
  end
end
