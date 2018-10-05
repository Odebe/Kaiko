# frozen_string_literal: true

class ProjectValidator < Validations::Base
  MAX_FILE_SIZE = 4 # in mb

  SCHEMA = Dry::Validation.Schema(BaseModelValidator) do
    required(:title).filled(unique?: :title)
    required(:description).filled
    required(:cover)
    optional(:cover_cache)
  end

  def call(params, with:)
    check_before_validations!(params, with)
    @valid ? SCHEMA.with(record: with[:record]).call(params).to_monad : Dry::Monads::Failure('meh')
  end

  private

  def check_before_validations!(params, with_hash)
    @valid = check_file_size(:cover, with: { params: params, record: with_hash[:record], max_size: MAX_FILE_SIZE })
  end
end
