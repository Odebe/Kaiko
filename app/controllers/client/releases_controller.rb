# frozen_string_literal: true

module Client
  class ReleasesController < ApplicationController
    before_action :set_release, only: :show
    before_action :set_markdown

    def index
      @releases = Releases::QueryService.new.call(params)
    end

    def show; end

    private

    def set_post
      @post = Releases::QueryService.new.call(params)
    end
  end
end
