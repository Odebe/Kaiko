PostValidator = Dry::Validation.Schema do
  required(:title).filled
  required(:text).filled
  required(:post_type).filled(:int?)
  required(:project_id).maybe(:int?)
end