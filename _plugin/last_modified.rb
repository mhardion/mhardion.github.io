module Jekyll
    class LastModifiedTag < Liquid::Tag
      def initialize(tag_name, file_path, tokens)
        super
        @file_path = file_path.strip
      end
  
      def render(context)
        site = context.registers[:site]
        full_path = File.join(site.source, @file_path)
        if File.exist?(full_path)
          File.mtime(full_path).strftime("%B %Y")
        else
          "File not found"
        end
      end
    end
  end
  
  Liquid::Template.register_tag('last_modified', Jekyll::LastModifiedTag)