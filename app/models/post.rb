# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: %i[unpublished published]
  has_many :comments, dependent: :destroy
end
