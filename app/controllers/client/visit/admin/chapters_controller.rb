# frozen_string_literal: true

module Admin
  class ChaptersController < Admin::ApplicationController
    before_action :set_project, only: %i[update edit create destroy]
    before_action :set_chapter, only: %i[update edit destroy]

    def new; end

    def edit; end

    def show; end

    def create
      result = CreateChapter.new.call(params)
      if result.success?
        redirect_to [:admin, @project], notice: 'Chapter was successfully created.'
      else
        redirect_to [:admin, @project], notice: result.failure
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

    def release

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
