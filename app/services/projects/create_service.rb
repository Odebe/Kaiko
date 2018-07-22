# frozen_string_literal: true

module Projects
  # this service handle project creation
  class CreateService
    include Projects::ServicesHelper

    def initialize(params)
      @validation_result = ProjectValidator.call(project_params(params))
      @project = Project.new(verified_params) do |project|
        project.errors[:base] << errors unless valid_record?
      end
    end

    def create
      @project.save!(verified_params)
    end
  end
end
