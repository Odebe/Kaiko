# frozen_string_literal: true

class UpdatePost
  include Dry::Transaction
  include Dry::Monads::Result::Mixin
  include TransactionsHelper

  step :prepare
  step :find_post
  step :validate_params
  step :update

  private

  def prepare(input)
    prepare_params(input, :post)
  end

  def find_post(input)
    @post = Post.find_by_id(input[:id])
    @post.present? ? Success(input) : Failure('post not found')
  end

  def validate_params(input)
    res = PostValidator.call(input)
    res.success? ? Success(res.to_h) : Failure(res.messages)
  end

  def update(input)
    @post.update(input)
    if @post.valid?
      Success(@post)
    else
      Failure(@post.errors.messages)
    end
  end
end
