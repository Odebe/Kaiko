# frozen_string_literal: true

module Posts
  class DeleteService
    include Posts::ServicesHelper

    def initialize(params)
      @id = params[:id]
      @_params = post_params(params)
    end

    def call
      post = Post.find_by_id(@id)
      if post.blank?
        end_call(:error, 'post_not_found')
      else
        if post.delete 
          end_call(:ok)
        else
          end_call(:error, :deleting, post.errors)
        end
      end
    end

  end
end
