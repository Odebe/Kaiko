# frozen_string_literal: true

module ApplicationHelper
  def current_item?(test_path)
    return ['item', 'active'] if request.parameters['controller'] == test_path
    'item'
  end
end
