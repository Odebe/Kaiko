# frozen_string_literal: true

module Admin
  module Releases
    # this service handle post searching
    class QueryService

      PARAMS = { per: 25 }.freeze

      def initialize
        @init_scope = Release.all.order(id: :desc).includes(:chapter, :project)
      end

      def call(params)
        post = filter_by_id(params)
        return post if post.present?

        scope = @init_scope
        scope = filter_by_page(scope, params[:page])
        scope
      end

      private

      def filter_by_id(params)
        id = params[:post_id] || params[:id]
        id.present? ? find(id) : nil
      end

      def filter_by_page(scope, page_num)
        if page_num.present?
          scope.page(page_num).per(PARAMS[:per])
        else
          scope.page(0).per(PARAMS[:per])
        end
      end

      def find(post_id)
        Release.find(post_id)
      end
    end
  end
end
