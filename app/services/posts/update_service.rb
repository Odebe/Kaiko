# frozen_string_literal: true

module Posts
  # this service handle post updating
  class UpdateService
    include Posts::ServicesHelper

    def initialize(params)
      # TODO: change this part
      @id = params[:id]
      @post = Post.find(@id)
      @validation_result = PostValidator.call(post_params(params))
      @post.errors[:base] << errors unless valid_record?
    end

    def update
      @post.update(verified_params)
    end
  end
end
