# frozen_string_literal: true

class UpdatePerson
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :find_staff
  step :validate_params
  step :update

  private

  def prepare(input)
    prepare_params(input, :person)
  end

  def find_staff(input)
    @obj = Person.find_by_id(input[:id])
    @obj.present? ? Success(input) : Failure('obj not found')
  end

  def validate_params(input)
    res = PeopleValidator.call(input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def update(input)
    @obj.update(input)
    if @obj.valid?
      Success(@obj)
    else
      Failure(@obj.errors.messages)
    end
  end
end
