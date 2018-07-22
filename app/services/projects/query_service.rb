# frozen_string_literal: true

module Projects
  # this service handle projects  searching
  class QueryService
    include Projects::ServicesHelper

    def initialize
      @init_scope = Project.all.order(id: :desc)
    end

    def call(params)
      return find(params[:id]) if params[:id].present?
      scope = @init_scope
      # ...
      scope
    end

    private

    def find(post_id)
      Project.find(post_id)
    end
  end
end
