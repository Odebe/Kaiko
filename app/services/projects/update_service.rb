# frozen_string_literal: true

module Projects
  # this service handle projects updating
  class UpdateService
    include Projects::ServicesHelper

    def initialize(params)
      # TODO: change this part
      @id = params[:id]
      @project = Project.find(@id)
      @validation_result = ProjectValidator.call(project_params(params))
      @project.errors[:base] << errors unless valid_record?
    end

    def update
      @project.update(verified_params)
    end
  end
end
