# frozen_string_literal: true

class PostValidator < Validations::Base
  SCHEMA = Dry::Validation.Schema do
    required(:title).filled
    required(:text).filled
    optional(:status)
  end

  def call(params, with:)
    @valid ? SCHEMA.with(record: with[:record]).call(params).to_monad : Dry::Monads::Failure('meh')
  end
end
