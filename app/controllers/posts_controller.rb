# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: :show
  before_action :set_markdown

  def index
    @posts = Posts::QueryService.new.call(params)
  end

  def show; end

  private

  def set_post
    @post = Posts::QueryService.new.call(params)
  end
end
