# frozen_string_literal: true

module Client
  class PeopleController < ApplicationController
    def index
      @people = Person.all.order(:id) # not a big deal at this time
    end
  end
end
