# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[index show]
  before_action :set_markdown

  def index
    @posts = Posts::QueryService.new.call({})
  end
  def show
    puts params.fetch(:id)
  end

  private

  def set_post
    @post = Posts::QueryService.new.call(params)
  end
end
