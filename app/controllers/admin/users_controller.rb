# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.page(params[:page]).per(14)
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

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end
