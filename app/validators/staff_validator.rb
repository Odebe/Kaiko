# frozen_string_literal: true

StaffValidator = Dry::Validation.Schema do
  required(:name).filled
  required(:situations).filled
end
