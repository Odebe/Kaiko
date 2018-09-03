# frozen_string_literal: true

module Admin
  class ReleasesController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :authorize_release
    before_action :set_release, only: %i[show edit update destroy publish]

    def index
      relations = %i[project chapter]
      scope = Release.includes(*relations)
      @releases = Queries::Service.new(scope).call(query_params).per(25)
    end

    def show; end

    def new
      @release = Release.new
    end

    def edit; end

    def create
      result = CreateRelease.new.call(params)
      if result.success?
        @post = result.value!
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        @post = Release.new
        @post.errors[:base].push(result.failure)
        render :new
      end
    end

    def update
      result = UpdateRelease.new.call(params)
      if result.success?
        @post = result.value!
        redirect_to [:admin, @post], notice: 'Post was successfully created.'
      else
        @post = Release.new
        @post.errors[:base].push(result.failure)
        render :new
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
    end

    def publish
      service = PublishService.new(params)
      @post = service.post
      if service.publish!
        redirect_to [:admin, @post], notice: 'Post was successfully published.'
      else
        # make error or something
        redirect_to [:admin, @post], notice: 'Post was not successfully published.'
      end
    end

    private

    def authorize_release
      authorize [:admin, Release]
    end

    def query_params
      params.slice(*PERMITTED_QUERY_PARAMS)
    end

    def set_release
      @release = Release.find(params[:id])
    end
  end
end
