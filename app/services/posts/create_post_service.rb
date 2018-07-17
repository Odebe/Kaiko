class CreatePostService
  include PostServicesHelper

  def initialize(params)
    @params = post_params(params)
  end

  def call
    validation_result = PostValidator.call(@params)
    if validation_result.failure?
      end_call(:error, validation_result.messages)
    else
      post = Post.create(params)
      if post.valid?
        end_call(:ok, post)
      else
        end_call(:error, post.errors.messages)
      end
    end 
  end
end