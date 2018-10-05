# frozen_string_literal: true

class Project < ApplicationRecord
  mount_uploader :cover, ProjectCoverUploader
  has_many :chapters
end
