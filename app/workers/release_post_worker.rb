# frozen_string_literal: true

class ReleasePostWorker
  include Sidekiq::Worker
  def perform(chapter)
    create_service = Posts::CreateService.new(
      title: "Релиз #{chapter.project.title} главы #{chapter.num}",
      text: 'текст релиза',
      post_type: 'release_item',
      project_id: chapter.project.id
    )
    create_service.create if create_service.valid_record?
  end
end
