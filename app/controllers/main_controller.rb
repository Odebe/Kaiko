# frozen_string_literal: true

class MainController < ApplicationController
  before_action :set_post, only: :show
  before_action :set_markdown

  def index
    @posts = Posts::QueryService.new.call(params).last(8)
    @releases = Releases::QueryService.new.call(params).last(8)
  end

  def show; end

  private

  def set_post
    @post = Posts::QueryService.new.call(params)
  end
end