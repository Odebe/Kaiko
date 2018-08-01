# frozen_string_literal: true

module Posts
  # this service handle post publishing
  class PublishService
    # include Posts::ServicesHelper

    def initialize(params)
      @post = Post.find(params[:id])
    end

    def publish!
      @post.published!
    end
  end
end
