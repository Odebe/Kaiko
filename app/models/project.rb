# frozen_string_literal: true

class Project < ApplicationRecord
  mount_uploader :preview, ProjectPreviewUploader
  validates :title, presence: true
  validates :description, presence: true
end
