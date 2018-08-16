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
    res = PeopleValidator.call(input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def create(input)
    result = Person.new(input)
    if result.valid?
      result.save
      Success(result)
    else
      Failure(result.errors.messages)
    end
  end
end
