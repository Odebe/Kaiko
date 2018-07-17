# frozen_string_literal: true

class Post < ApplicationRecord
  # validates :title, presence: true
  # validates :text, presence: true
  # validates :post_type, presence: true

  enum post_type: %i[news_item release_item]
  belongs_to :project, optional: true
  has_many :comments
end
