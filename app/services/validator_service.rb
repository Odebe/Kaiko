# frozen_string_literal: true

# ValidatorService.call(Release, input)
# ValidatorService.call(Release, { chapter_id: 123, project_id: '123' })
class ValidatorService
  def self.call(model_class, params)
    # TODO: add rescue things
    "#{model_class.name}Validator".constantize.with(params: params, model: model_class).call(params)
  end
end
