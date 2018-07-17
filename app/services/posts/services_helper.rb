# frozen_string_literal: true

module Posts
  module ServicesHelper
    REQUIRED_PARAMS = %i[title text post_type project_id]

    def end_call(status, post = nil)
      [status, post]
    end

    def post_params(params)
      res = params.fetch(:post, {}).permit(REQUIRED_PARAMS).to_h
      res[:project_id] = res[:project_id].to_i
      res
    end
  end
end
