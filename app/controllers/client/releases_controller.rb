# frozen_string_literal: true

module Client
  class ReleasesController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :set_release, only: :show
    before_action :set_markdown

    def index
      relations = %i[project chapter]
      scope = Release.includes(*relations)
      @releases = Queries::Service.new(scope).call(query_params).per(15)
    end

    def show; end

    private

    def query_params
      params.slice(*PERMITTED_QUERY_PARAMS)
    end

    def set_post
      @post = Releases::QueryService.new.call(params)
    end
  end
end
