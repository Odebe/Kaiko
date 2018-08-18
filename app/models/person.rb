class Person < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
