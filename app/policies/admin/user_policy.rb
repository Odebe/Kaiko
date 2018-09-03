module Admin
  class UserPolicy < ApplicationPolicy

    def edit?
      user.admin?
    end

    def update?
      user.admin?
    end

    def delete?
      user.admin?
    end

    def admin?
      user.admin?
    end

    def operator?
      user.admin?
    end

    def user?
      user.admin?
    end

  end
end
