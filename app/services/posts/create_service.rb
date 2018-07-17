# frozen_string_literal: true

module Posts
  class CreateService
    include Posts::ServicesHelper

    def initialize(params)
      logger = Logger.new(STDOUT)

      logger.info "params: #{params}"
      logger.info "params title: #{params[:title]}"
      @params = post_params(params)
      logger.info "post_params: #{@params}"
    end

    def call
      validation_result = PostValidator.call(@params)
      if validation_result.failure?
        end_call(:error, validation_result.messages)
      else
        post = Post.create(@params)
        if post.valid?
          end_call(:ok, post)
        else
          end_call(:error, post.errors.messages)
        end
      end 
    end
  end
end
