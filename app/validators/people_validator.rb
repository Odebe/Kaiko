# frozen_string_literal: true

PeopleValidator = Dry::Validation.Schema do
  required(:name).filled
  required(:situations).filled
end
