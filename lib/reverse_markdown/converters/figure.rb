module ReverseMarkdown
  module Converters
    class Figure < Base
      def convert(node, state = {})
        if node.children.map(&:name).include?('img')
          caption = nil
          src = nil

          node.children.each do |c|
            case c.name
            when 'figcaption'
              caption = c.text
            when 'img'
              src = c.attr 'src'
            end
          end

          " ![#{caption}](#{src})"
        else
          treat_children(node, state)
        end
      end
    end

    register :figure, Figure.new
  end
end
