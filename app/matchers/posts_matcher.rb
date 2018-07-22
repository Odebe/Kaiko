# frozen_string_literal: true

# success_case = Dry::Matcher::Case.new(
#   match: ->(value) { value.first == :ok },
#   resolve: ->(value) { value.last }
# )
# failure_case = Dry::Matcher::Case.new(
#   match: ->(value) { value.first == :error },
#   resolve: ->(value) { value.last }
# )
# PostsMatcher = Dry::Matcher.new(success: success_case, failure: failure_case)
