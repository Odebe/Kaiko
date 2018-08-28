# frozen_string_literal: true

module ProjectsHelper
  def is_disabled_for?(action)
    controller.action_name == action ? true : false
  end

  def can_be_released?(releases, chapter_id)
    releases.none? { |r| r[1] == chapter_id }
  end
end
