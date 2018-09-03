# frozen_string_literal: true

module Admin
  class ProjectsController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :authorize_project
    before_action :set_project, only: %i[show edit update destroy]

    def index
      @projects = Queries::Service.new(Project).call(query_params)
    end

    def show
      @chapter = @project.chapters.build
      @releases = Release.where(project_id: @project.id).pluck(:id, :chapter_id)
    end

    def new
      @project = Project.new
    end

    def edit; end

    def create
      result = CreateProject.new.call(params)
      if result.success?
        @project = result.value!
        redirect_to [:admin, @project]
      else
        @project = Project.new
        @project.errors[:base].push(result.failure)
        render :new
      end
    end

    def update
      result = UpdateProject.new.call(params)
      if result.success?
        @project = result.value!
        redirect_to admin_project_path(@project)
      else
        @project = Project.new
        @project.errors[:base].push(result.failure)
        render :edit
      end
      # update_service = Projects::UpdateService.new(params)
      # @project = update_service.project
      # if update_service.valid_record? && update_service.update
      #   redirect_to [:admin, @project]
      # else
      #   render :edit
      # end
    end

    def destroy
      @project.destroy
      redirect_to admin_projects_url, notice: 'Project was successfully destroyed.'
    end

    private

    def authorize_project
      authorize [:admin, Project]
    end

    def query_params
      params.slice(*PERMITTED_QUERY_PARAMS)
    end

    def set_project
      @project = Project.includes(:chapters).find(params[:id])
    end
  end
end
