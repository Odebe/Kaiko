# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :set_post, only: %i[create destroy]

  def new; end

  private

  def set_post
    @post = Posts::QueryService.new.call(params)
  end

  def comment_params
    params.fetch(:comment, {}).permit(:text)
  end
end
