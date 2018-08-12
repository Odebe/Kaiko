class Chapter < ApplicationRecord
  belongs_to :project
  has_one :release, dependent: :destroy
end
