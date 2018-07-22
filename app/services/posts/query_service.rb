# frozen_string_literal: true

module Posts
  # this service handle post searching
  class QueryService
    include Posts::ServicesHelper

    def initialize
      @init_scope = Post.all.order(id: :desc)
    end

    def call(params)
      return find(params[:id]) if params[:id].present?
      scope = @init_scope
      # ...
      scope
    end

    private

    def find(post_id)
      Post.find(post_id)
    end
  end
end
