# frozen_string_literal: true

module Client
  class ProjectsController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :set_project, only: :show

    def index
      @projects = Queries::Service.new(Project).call(query_params)
    end

    def show; end

    private

    def query_params
      # params.slice(*PERMITTED_QUERY_PARAMS)
      {}
    end

    def set_project
      @project = Project.includes(:chapters).find(params[:id])
    end
  end
end
