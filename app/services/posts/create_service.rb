# frozen_string_literal: true

module Posts
  # this service handle post creation
  class CreateService
    include Posts::ServicesHelper

    def initialize(params)
      @validation_result = PostValidator.call(post_params(params))
      @post = Post.new(verified_params) do |post|
        post.errors[:base] << errors unless valid_record?
      end
    end

    def create
      @post.save!(verified_params)
    end
  end
end
