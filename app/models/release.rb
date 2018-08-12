class Release < ApplicationRecord
  belongs_to :project
  belongs_to :chapter
end
