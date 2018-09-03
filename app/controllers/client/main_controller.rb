# frozen_string_literal: true

module Client
  class MainController < ApplicationController
    def index
      @posts = Queries::Service.new(Post).call({}).first(8)
      @releases = Queries::Service.new(Release.includes(:project, :chapter)).call({}).first(8)
    end
  end
end
