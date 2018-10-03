# frozen_string_literal: true

# Validations::Service.call(Release, input)
# Validations::Service.call(Release, { chapter_id: 123, project_id: '123' })
module Validations
  class Service
    def self.call(record, params)
      # TODO: add rescue things
      "#{record.class.name}Validator".constantize.new.call(params, with: { record: record })
    end
  end
end
