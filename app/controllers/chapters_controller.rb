# frozen_string_literal: true

class ChaptersController < ApplicationController
  before_action :set_project, only: %i[create destroy]
  before_action :set_chapter, only: %i[destroy edit]

  def new; end

  def edit; end

  def create
    chapter = @project.chapters.create(chapter_params)
    if chapter.valid?
      ReleasePostWorker.perform_async(chapter.id)
      redirect_to @project, notice: 'Comment was successfully created.'
    else
      redirect_to @project, notice: chapter.errors 
    end
  end

  def destroy
    @chapter.destroy
    redirect_to @chapter
  end

  private

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def chapter_params
    params.fetch(:chapter, {}).permit(:title, :vol, :num)
  end
end
