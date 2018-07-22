# frozen_string_literal: true

class Project < ApplicationRecord
  mount_uploader :preview, ProjectPreviewUploader
  has_many :chapters
  # validates :title, presence: true
  # validates :description, presence: true
end
