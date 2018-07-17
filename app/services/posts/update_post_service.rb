class UpdatePostService
  include PostServicesHelper

  def initialize(params)
    @id = params[:id]
    @params = post_params(params)
  end

  def call
    post = Post.where(id: @id)
    return end_call(:error, 'post_not_found') if post.blank?
    validation_result = PostValidator.call(params.fetch(:post, {}))
    return end_call(:ok, validation_result.messages) if validation_result.failure?
    update_result = post.update(validation_result.to_h)
    end_call(update_result, post) 
  end
end