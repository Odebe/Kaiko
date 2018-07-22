# frozen_string_literal: true

module Posts
  # helpers for post services
  module ServicesHelper
    # see post attributes in  post_validator.rb
    REQUIRED_PARAMS = %i[title text post_type project_id].freeze

    attr_reader :post

    def valid_record?
      # TODO: change this part i guess
      @validation_result.success?
    end

    def errors
      @validation_result.messages
    end

    def post_params(params)
      params.fetch(:post, {}).permit(REQUIRED_PARAMS).to_h
    end

    def verified_params
      @validation_result.to_h
    end
  end
end
