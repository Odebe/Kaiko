module Admin
  class ApplicationPolicy < ::ApplicationPolicy

    def index?
      user.operator? || user.admin?
    end

    def new?
      user.operator? || user.admin?
    end

    def show?
      user.operator? || user.admin?
    end

    def create?
      user.operator? || user.admin?
    end

    def edit?
      user.operator? || user.admin?
    end

    def update?
      user.operator? || user.admin?
    end

    def destroy?
      user.operator? || user.admin?
    end

  end
end
