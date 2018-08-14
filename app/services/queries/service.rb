# frozen_string_literal: true

module Queries
  class Service
    def initialize(init_scope)
      @scope = init_scope
      @filters = find_filters
    end

    # Queries::Service.new(Release).call(page: 1, project_id: 2)
    def call(params)
      engine.call(params)
    end

    private

    def engine
      Queries::Lib::Engine.new(@scope, @filters)
    end

    def find_filters
      "Queries::Filters::#{scope_model}".constantize.call
    rescue NameError => e
      # TODO: better rescue
      Rails.logger.error "Can't find filter.\nError: #{e}\nBacktrace: #{e.backtrace}"
      []
    end

    def scope_model
      @_scope_model ||= 
        if @scope.respond_to?('model')
          @scope.model.name
        else
          @scope.name
        end
    end
  end
end
