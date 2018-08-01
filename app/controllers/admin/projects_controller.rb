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
      create_service = Projects::CreateService.new(params)
      @project = create_service.project
      if create_service.valid_record?
        create_service.create
        redirect_to [:admin, @project]
      else
        render :new
      end
    end

    def update
      update_service = Projects::UpdateService.new(params)
      @project = update_service.project
      if update_service.valid_record? && update_service.update
        redirect_to [:admin, @project]
      else
        render :edit
      end
    end

    def destroy
      @project.destroy
      redirect_to [:admin, projects_url], notice: 'Project was successfully destroyed.'
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
