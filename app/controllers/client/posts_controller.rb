# frozen_string_literal: true

module Client
  class PostsController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :set_post, only: :show
    before_action :set_markdown

    def index
      @posts = Queries::Service.new(Post).call(query_params).per(10)
    end

    def show; end

    private

    def query_params
      params.slice(*PERMITTED_QUERY_PARAMS)
    end

    def set_post
      @post = Post.find(params[:id])
    end
  end
end
