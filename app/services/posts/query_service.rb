# frozen_string_literal: true

module Posts
  # this service handle post searching
  class QueryService
    include Posts::ServicesHelper

    def initialize
      @init_scope = Post.all.order(id: :desc)
    end

    def call(params)
      post = filter_by_id(params)
      return post if post.present?

      scope = @init_scope
      # ...
      scope
    end

    private

    def filter_by_id(params)
      id = params[:post_id] || params[:id]
      id.present? ? find(id) : nil
    end

    def find(post_id)
      Post.find(post_id)
    end
  end
end
