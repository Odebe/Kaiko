# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
    
    layout 'admin'
    
    # before_action :mem

    # private

    # def set_markdown
    #   @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI)
    # end

    # def mem
    #   puts GetProcessMem.new.inspect
    # end
  end
end
