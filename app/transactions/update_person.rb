# frozen_string_literal: true

class UpdatePerson
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :find_record
  step :validate_params
  step :update

  private

  def prepare(input)
    prepare_params(input, :person)
  end

  def find_record(input)
    record = Person.find_by_id(input[:id])
    record.present? ? Success(record: record, params: input) : Failure('record not found')
  end

  def validate_params(input)
    res = ValidatorService.call(input[:record], input[:params])
    res.success? ? Success(record: input[:record], params: res.to_h) : Failure(res.messages)
  end

  def update(input)
    input[:record].update(input[:params]) ? Success(input[:record]) : Failure(input[:record].errors.messages)
  end
end
