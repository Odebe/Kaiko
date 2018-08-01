# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: %i[unpublished published]
  enum post_type: %i[news_item release_item]
  belongs_to :project, optional: true
  has_many :comments, dependent: :destroy
end
