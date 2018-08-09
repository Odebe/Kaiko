# frozen_string_literal: true

module TransactionsHelper
  def prepare_params(input, key)
    res =
      if input.is_a? ActionController::Parameters
        input.fetch(key, input).to_unsafe_h.merge(id: input[:id])
      else
        input
      end
    Success(res)
  end
end
