# frozen_string_literal: true

module Admin
  class PeopleController < ApplicationController
    before_action :set_person, only: %i[show edit update destroy publish]

    def index
      @people = Person.all # not a big deal
    end

    def show; end

    def new
      @person = Person.new
    end

    def edit; end

    def create
      result = CreatePerson.new.call(params)
      if result.success?
        @person = result.value!
        redirect_to admin_people_path, notice: 'person was successfully created.'
      else
        @person = Person.new
        @person.errors[:base].push(result.failure)
        render :new
      end
    end

    def update
      result = UpdatePerson.new.call(params)
      if result.success?
        @person = result.value!
        redirect_to admin_people_path, notice: 'person was successfully created.'
      else
        @person = Person.new
        @person.errors[:base].push(result.failure)
        render :new
      end
    end

    def destroy
      @person.destroy
      redirect_to admin_people_path, notice: 'Post was successfully destroyed.'
    end

    private

    def set_person
      @person = Person.find(params[:id])
    end
  end
end
