# frozen_string_literal: true

class PersonValidator < Validations::Base
  MAX_FILE_SIZE = 3 # in mb

  SCHEMA = Dry::Validation.Schema(BaseModelValidator) do
    required(:name).filled(unique?: :name)
    required(:situations).filled
    optional(:avatar)
    optional(:avatar_cache)
  end

  def call(params, with:)
    check_before_validations!(params, with)
    @valid ? SCHEMA.with(record: with[:record]).call(params).to_monad : Dry::Monads::Failure('meh')
  end

  private

  def check_before_validations!(params, with_hash)
    @valid = check_file_size(:avatar, with: { params: params, record: with_hash[:record], max_size: MAX_FILE_SIZE })
  end
end
