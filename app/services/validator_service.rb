# frozen_string_literal: true

# ValidatorService.call(Release, input)
# ValidatorService.call(Release, { chapter_id: 123, project_id: '123' })
class ValidatorService
  def self.call(record, params)
    # TODO: add rescue things
    "#{record.class.name}Validator".constantize.with(record: record).call(params)
  end
end
