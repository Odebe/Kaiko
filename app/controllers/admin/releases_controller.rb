# frozen_string_literal: true

module Admin
  class ReleasesController < ApplicationController
    before_action :set_release, only: %i[show edit update destroy publish]
    before_action :set_markdown

    def index
      @releases = Admin::Releases::QueryService.new.call(params)
    end

    def show; end

    def new
      @release = Release.new
    end

    def edit; end

    def create
      result = CreateRelease.new.call(params)
      if result.success?
        @post = result.value!
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        @post = Release.new
        @post.errors[:base].push(result.failure)
        render :new
      end
    end

    def update
      result = UpdateRelease.new.call(params)
      if result.success?
        @post = result.value!
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        @post = Release.new
        @post.errors[:base].push(result.failure)
        render :new
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
    end

    def publish
      service = PublishService.new(params)
      @post = service.post
      if service.publish!
        redirect_to [:admin, @post], notice: 'Post was successfully published.'
      else
        # make error or something
        redirect_to [:admin, @post], notice: 'Post was not successfully published.'
      end
    end

    private

    def set_release
      @release = Admin::Releases::QueryService.new.call(params)
    end

    def set_markdown
      @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
    end

    # def post_params
    #   params.fetch(:post, {}).permit(:title, :text, :post_type, :project_id)
    # end
  end
end
