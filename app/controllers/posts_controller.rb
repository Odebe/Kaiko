# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_markdown

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.sort_by(&:id).reverse
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    post_creation_result = CreatePostService.new(params).call
    PostServiceMatcher.(post_creation_result) do |m|
      m.success do |post|
        redirect_to post, notice: 'Post was successfully created.'
      end

      m.failure do |_errors|
        render :new
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    post = UpdatePostService.new(params).()
    respond_to do |format|
      if post.present?
        format.html { redirect_to post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: post }
      else
        format.html { render :edit }
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
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

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_markdown
    @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
  end

  def post_params
    params.fetch(:post, {}).permit(:title, :text, :post_type, :project_id)
  end
end
