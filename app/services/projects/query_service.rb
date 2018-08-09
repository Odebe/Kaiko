# frozen_string_literal: true

module Projects
  # this service handle projects  searching
  class QueryService
    # include Projects::ServicesHelper

    def initialize
      @init_scope = Project.all.order(id: :desc)
    end

    def call(params)
      project = filter_by_id(params)
      return project if project.present?

      scope = @init_scope
      # ...
      scope
    end

    private

    def filter_by_id(params)
      id = params[:project_id] || params[:id]
      id.present? ? find(id) : nil
    end

    def find(post_id)
      Project.find(post_id)
    end
  end
end
