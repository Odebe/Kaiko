# frozen_string_literal: true

module Validations
  class Base
    include Dry::Monads::Result::Mixin
    Dry::Validation.load_extensions(:monads)

    def initialize
      @valid = true
    end

    private

    # TODO: refactor this part later, lololol
    def check_file_size(name, with:)
      file_pass_rule = lambda do |file|
        file.respond_to?(:size) && file.size / 1024 < with[:max_size] * 1024
      end
      record = with[:record]
      if record.new_record?
        return false if with[:params][name].nil? || !file_pass_rule.call(with[:params][name])
      else
        return false if !with[:params][name].nil? && !file_pass_rule.call(with[:params][name])
      end
      true
    end
  end
end
