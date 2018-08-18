# frozen_string_literal: true

module Admin
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
      @projects = Projects::QueryService.new.call(params)
    end

    def show
      @chapter = @project.chapters.build
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

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Projects::QueryService.new.call(params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def project_params
    #   params.require(:project).permit(:title, :description, :preview)
    # end
  end
end
