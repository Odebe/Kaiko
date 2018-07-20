# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_markdown

  def index
    @posts = Posts::QueryService.new.call(params)
  end

  def show; end

  def edit; end

  def create
    create_service = Posts::CreateService.new(params)
    @post = create_service.post
    if create_service.valid_record?
      create_service.create
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    update_service = Posts::UpdateService.new(params)
    @post = update_service.post
    if update_service.valid_record? && update_service.update
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Posts::QueryService.new.call(params)
  end

  def set_markdown
    @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
  end

  # def post_params
  #   params.fetch(:post, {}).permit(:title, :text, :post_type, :project_id)
  # end
end
