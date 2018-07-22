# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :set_post, only: %i[create destroy]

  def new; end

  def edit; end

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params)
    if comment.valid?
      edirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: comment.errors 
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Posts::QueryService.new.call(id: params[:post_id])
  end

  def comment_params
    params.fetch(:comment, {}).permit(:text)
  end
end
