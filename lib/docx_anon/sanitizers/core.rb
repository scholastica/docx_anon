module DocxAnon
  module Sanitizers
    module Core

      FILE_HANDLER = "docProps/core.xml"

      def self.call(entry)
        puts "SANITIZING #{entry.name}" if DocxAnon.config.verbose
        doc = Nokogiri::XML(entry.get_input_stream.read)
        namespaces = doc.namespaces

        if namespaces.keys.include?("xmlns:dc")
          doc.search("//dc:creator").remove
        end

        if namespaces.keys.include?("xmlns:cp")
          doc.search("//cp:lastModifiedBy").remove
        end

        if !doc.search("coreProperties/lastModifiedBy").nil?
          doc.search("coreProperties/lastModifiedBy").remove
        end

        doc.to_xml
      end

    end
  end
end
