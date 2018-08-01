# frozen_string_literal: true

module ApplicationHelper
  def current_item?(test_path)
    return ['item', 'active'] if request.parameters['controller'] == test_path
    'item'
  end

  POST_TYPES = {
    'release_item' => 'Релиз',
    'news_item' => 'Новость'
  }.freeze

  POST_PARTIALS = {
    'release_item' => 'posts/release_item',
    'news_item' => 'posts/news_item'
  }.freeze

  def post_type(type)
    POST_TYPES[type]
  end

  def partial_by_post_type(type)
    POST_PARTIALS[type]
  end
end
