module Admin
  class ChapterPolicy < ApplicationPolicy
    def release?
      user.operator? || user.admin?
    end
  end
end
