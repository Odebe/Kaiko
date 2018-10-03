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
    res = Validations::Service.call(Person.new(input), input)
    res.success? ? Success(res.success) : Failure(res.failure)
  end

  def create(input)
    record = Person.create(input)
    record.valid? ? Success(record) : Failure(record.errors.messages)
  end
end
