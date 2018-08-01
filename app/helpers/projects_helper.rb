# frozen_string_literal: true

module ProjectsHelper
  def is_disabled_for?(action)
    controller.action_name == action ? true : false
  end
end
