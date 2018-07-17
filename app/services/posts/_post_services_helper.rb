module PostServicesHelper
  def end_call(status, post = nil)
    [status, post]
  end

  def post_params(params)
    params.fetch(:post, {})
  end
end