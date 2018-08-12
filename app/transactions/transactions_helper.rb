# frozen_string_literal: true

module TransactionsHelper
  def prepare_params(input, key, parent_keys = {})
    result =
      if input.is_a? ActionController::Parameters
        get_params_from_acp(input, key, parent_keys)
      else
        input
      end
    Success(result)
  end

  def get_params_from_acp(input, key, parent_keys)
    result = input.fetch(key, input).to_unsafe_h.merge(id: input[:id])
    parent_keys.present? ? result.merge(perforn_pk(input.to_unsafe_h, parent_keys)) : result
  end

  def perforn_pk(params, parent_keys)
    # key_id = ->(k) { "#{k}_id".to_sym }
    parent_keys.each_with_object({}) do |p_key, h|
      key = "#{p_key}_id".to_sym
      h[key] = params[key]
    end
  end
end
