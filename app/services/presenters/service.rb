# frozen_string_literal: true

module Presenters
  class Service
    DEFAULT_ROLE = 'user'

    # Presenters::Service.call(Release.last, role: 'admin')
    def self.call(record, role: DEFAULT_ROLE)
      "#{module_name(role)}::#{model_name(record).capitalize}Presenter".constantize.new(record)
    end

    private

    def self.model_name(record)
      record.respond_to?('model') ? record.model.name : record.name
    end

    def self.module_name(role)
      (role == DEFAULT_ROLE) ? '' : "#{role.capitalize}"
    end
  end
end
