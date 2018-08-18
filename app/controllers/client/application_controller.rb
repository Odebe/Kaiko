# frozen_string_literal: true

module Client
  class ApplicationController < ActionController::Base
    layout 'application'
    before_action :mem

    private

    def set_markdown
      @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI)
    end

    def mem
      puts GetProcessMem.new.inspect
    end
  end
end
