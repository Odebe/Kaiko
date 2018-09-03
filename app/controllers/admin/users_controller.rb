# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    PERMITTED_QUERY_PARAMS = %i[page].freeze

    before_action :authorize_user
    before_action :set_user, only: %i[show edit update destroy admin operator user]

    def index
      # @users = User.page(params[:page]).per(14)
      @users = Queries::Service.new(User).call(query_params)
    end

    def show; end

    def edit; end

    def update
      # ...
    end

    def destroy
      @user.destroy
      redirect_to admin_posts_path, notice: 'User was successfully destroyed.'
    end

    def admin
      @user.admin! if @user != current_user
      redirect_to [:admin, @user]
    end

    def operator
      @user.operator! if @user != current_user
      redirect_to [:admin, @user]
    end

    def user
      @user.user! if @user != current_user
      redirect_to [:admin, @user]
    end

    private

    def query_params
      params.slice(*PERMITTED_QUERY_PARAMS)
    end

    def authorize_user
      authorize [:admin, User]
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
