# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_errors
  before_action :set_markdown

  # GET /posts
  # GET /posts.json
  def index
    # пока что так можно
    # TODO: вынести в сервис-запрос
    @posts = Post.all.sort_by(&:id).reverse
  end

  # GET /posts/1
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    matcher(
      result: Posts::CreateService.new(params).call,
      success: { note: 'Post was successfully created.' },
      failure: { render: :new }
    )
  end

  # PATCH/PUT /posts/1
  def update
    matcher(
      result: Posts::UpdateService.new(params).call,
      success: { note: 'Post was successfully updated.' },
      failure: { render: :edit }
    )
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def matcher(options)
    PostsMatcher.call(options[:result]) do |m|
      m.success do |post|
        @post = post
        redirect_to @post, notice: options[:success][:note]
      end

      m.failure do |errors|
        @errors << errors
        render options[:failure][:render]
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_errors
    @errors = []
  end

  def set_markdown
    @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
  end

  def post_params
    params.fetch(:post, {}).permit(:title, :text, :post_type, :project_id)
  end
end
