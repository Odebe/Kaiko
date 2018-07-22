# frozen_string_literal: true

module Projects
  # helpers for post services
  module ServicesHelper
    # see post attributes in project_validator.rb
    REQUIRED_PARAMS = %i[title description preview preview_cache].freeze

    attr_reader :project

    def valid_record?
      # TODO: change this part i guess
      @validation_result.success?
    end

    def errors
      @validation_result.messages
    end

    def project_params(params)
      params.fetch(:project, {}).permit(REQUIRED_PARAMS).to_h
    end

    def verified_params
      @validation_result.to_h
    end
  end
end
