# frozen_string_literal: true

class CreatePerson
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :validate
  step :create

  private

  def prepare(input)
    prepare_params(input, :person)
  end

  def validate(input)
    res = ValidatorService.call(Person.new(input), input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def create(input)
    record = Person.create(input)
    record.valid? ? Success(record) : Failure(record.errors.messages)
  end
end
