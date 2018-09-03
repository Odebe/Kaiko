# frozen_string_literal: true

module Client
  class CommentsController < ApplicationController
    before_action :set_post, only: %i[create destroy]
    before_action :set_comment, only: %i[destroy]

    def new; end

    def create
      @post.comments.create(comment_params)
      redirect_to @post
    end

    def destroy
      @comment.destroy
      redirect_to @post
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.fetch(:comment, {}).permit(:text)
    end
  end
end
