# frozen_string_literal: true

module Client
  class PeopleController < ApplicationController
    def index
      @people = Person.all # not a big deal at this time
    end
  end
end
