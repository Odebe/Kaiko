# frozen_string_literal: true
class MarkdownToSemanticUI < Redcarpet::Render::HTML
  def block_quote(quote)
    %(<blockquote class="my-custom-class">#{quote}</blockquote>)
  end
  def list(li, type)
    %[<ol class="ui list">#{li}</ol>]
  end

  def paragraph(text)
    %[<p class="text">#{text}</p>]
  end

  def header(text, level)
    %[<h#{level} class="ui header">#{text}</h#{level}>]
  end 

  def image(link, title, style)
    %[<img class="ui #{style} image" src="#{link}">]
  end
end