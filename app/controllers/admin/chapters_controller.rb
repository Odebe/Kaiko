# frozen_string_literal: true

module Admin
  class ChaptersController < Admin::ApplicationController
    before_action :set_project, only: %i[update edit create destroy]
    before_action :set_chapter, only: %i[update edit destroy]

    def new; end

    def edit; end

    def show; end

    def create
      chapter = @project.chapters.create(chapter_params)
      if chapter.valid?
        # ReleasePostWorker.perform_async(chapter.id)
        redirect_to [:admin, @project], notice: 'Comment was successfully created.'
      else
        redirect_to [:admin, @project], notice: chapter.errors 
      end
    end

    def update
      @chapter.update(chapter_params)
      redirect_to [:admin, @project]
    end

    def destroy
      @chapter.destroy
      redirect_to [:admin, @project]
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
end
