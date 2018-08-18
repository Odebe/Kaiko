# frozen_string_literal: true

module Client
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end
  end
end
