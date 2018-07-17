# frozen_string_literal: true

module Posts
  class UpdateService
    include Posts::ServicesHelper

    def initialize(params)
      @id = params[:id]
      @params = post_params(params)
    end

    def call
      post = Post.find_by_id(@id)
      if post.blank?
        end_call(:error, 'post_not_found')
      else
        validation_result = PostValidator.call(@params)
        if validation_result.failure?
          end_call(:ok, validation_result.messages)
        else
          update_result = post.update(validation_result.to_h)
          if update_result
            end_call(:ok, post)
          else
            end_call(:error, post.errors)
          end
        end 
      end
    end
    
  end
end
