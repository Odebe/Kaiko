# frozen_string_literal: true

module Admin
  class PostsController < ApplicationController
    before_action :set_post, only: %i[show edit update destroy publish]
    before_action :set_markdown

    def index
      @posts = Admin::Posts::QueryService.new.call(params)
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

    def set_post
      @post = Admin::Posts::QueryService.new.call(params)
    end

    def set_markdown
      @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
    end

    # def post_params
    #   params.fetch(:post, {}).permit(:title, :text, :post_type, :project_id)
    # end
  end
end
