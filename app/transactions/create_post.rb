# frozen_string_literal: true

class CreatePost
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :validate
  step :create

  private

  def prepare(input)
    prepare_params(input, :post)
  end

  def validate(input)
    res = Validations::Service.call(Post.new(input), input)
    res.success? ? Success(res.success) : Failure(res.failure)
  end

  def create(input)
    post = Post.new(input)
    if post.valid?
      post.save
      Success(post)
    else
      Failure(post.errors.messages)
    end
  end
end
