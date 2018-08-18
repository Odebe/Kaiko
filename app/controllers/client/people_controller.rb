# frozen_string_literal: true

module Client
  class PeopleController < ApplicationController
    # before_action :set_person, only: %i[show edit update destroy publish]

    def index
      @people = Person.all # not a big deal
    end
  end
end