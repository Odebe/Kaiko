# frozen_string_literal: true

class UpdateProject
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :find_project
  step :validate_params
  step :update

  private

  def prepare(input)
    prepare_params(input, :project)
  end

  def find_project(input)
    @project = Project.find_by_id(input[:id])
    @project.present? ? Success(input) : Failure('project not found')
  end

  def validate_params(input)
    res = ValidatorService.call(Project, input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def update(input)
    @project.update(input)
    if @project.valid?
      Success(@project)
    else
      Failure(@project.errors.messages)
    end
  end
end
