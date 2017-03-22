module Blogit
  module Admin
    module ApplicationHelper
      
      def actions(options = {}, &block)
        yield
      end
      
      def muted_text(text_or_options = {}, options ={}, &block)
        if block_given?
          content = capture(&block)
          options = text_or_options
        else
          content = text_or_options
        end
        options[:class] = Array(options[:class]) + [ "muted_text" ]
        content_tag(:div, content, options)
      end

    def format_content(content = nil, &block)
      content = capture(&block) if block_given?
      parser  = Blogit::configuration.default_parser_class.new(content)
      parser.parsed.to_s.html_safe
    end      
      
    end
  end
end
