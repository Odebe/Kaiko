# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :mem

  private

  def set_markdown
    @markdown = Redcarpet::Markdown.new(MarkdownToSemanticUI)
  end

  def mem
    puts GetProcessMem.new.inspect
  end
end
