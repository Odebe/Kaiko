# frozen_string_literal: true

class AddReleaseWorker
  include Sidekiq::Worker

  def perform(params)
    release_params = params.with_indifferent_access.slice(:chapter_id, :project_id)
    # result = CreateRelease.new.call(chapter_id: params['chapter_id'], project_id: params['project_id'])
    result = CreateRelease.new.call(release_params)
    puts "errors: #{result.failure}" if result.failure?
  end
end
