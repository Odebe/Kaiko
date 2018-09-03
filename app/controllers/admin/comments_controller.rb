# frozen_string_literal: true

module Admin
  class CommentsController < ApplicationController

    before_action :authorize_comment
    before_action :set_comment, only: %i[edit destroy]
    before_action :set_post, only: %i[create destroy]

    def new; end

    def edit; end

    def create
      comment = @post.comments.create(comment_params)
      if comment.valid?
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post, notice: comment.errors 
      end
    end

    def destroy
      @comment.destroy
      redirect_to [:admin, @post]
    end

    private

    def authorize_comment
      authorize [:admin, Comment]
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.fetch(:comment, {}).permit(:text)
    end
  end
end
