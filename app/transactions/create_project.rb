# frozen_string_literal: true

class CreateProject
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :validate
  step :create

  private

  def prepare(input)
    prepare_params(input, :project)
  end

  def validate(input)
    res = ProjectValidator.call(input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def create(input)
    project = Project.new(input)
    if project.valid?
      project.save
      Success(project)
    else
      Failure(project.errors.messages)
    end
  end
end
