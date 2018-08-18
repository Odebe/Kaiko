# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[index show]

  def index
    @projects = Projects::QueryService.new.call({})
  end
  def show; end

  private

  def set_project
    @project = Projects::QueryService.new.call(params)
  end
end
