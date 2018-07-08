# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :set_post, only: %i[destroy]

  def index
    # # @posts = Post.all.sort_by(&:id).reverse
    # @comments = Comment.where(post_id: params[:post_id]).sort_by(&:id).reverse
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @comments }
    # end
  end

  def new
    # @post = Comment.new
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params)
    respond_to do |format|
      if comment.valid?
        comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, notice: comment.errors }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @post }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_post
  #   @post = Post.find(params[:id])
  # end

  # def set_markdown
  #   @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI, tables: true)
  # end

  def comment_params
    params.fetch(:comment, {}).permit(:text)
  end
end
