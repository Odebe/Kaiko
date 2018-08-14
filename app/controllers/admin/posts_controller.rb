# frozen_string_literal: true

module Admin
  class PostsController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :set_post, only: %i[show edit update destroy publish]
    before_action :set_markdown

    def index
      @posts = Queries::Service.new(Post).call(query_params).per(25)
    end

    def show; end

    def new
      @post = Post.new
    end

    def edit; end

    def create
      result = CreatePost.new.call(params)
      if result.success?
        @post = result.value!
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        @post = Post.new
        @post.errors[:base].push(result.failure)
        render :new
      end
    end

    def update
      result = UpdatePost.new.call(params)
      if result.success?
        @post = result.value!
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        @post = Post.new
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

    def query_params
      params.slice(*PERMITTED_QUERY_PARAMS)
    end

    def set_post
      @post = Post.includes(:comments).find(params[:id])
    end

    def set_markdown
      @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
    end
  end
end
