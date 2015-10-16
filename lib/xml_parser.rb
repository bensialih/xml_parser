#must uncomment the require below
require "xml_parser/version"
require "ui/get_xml_ui"
require 'business/Element_editor'

class Xml_parser
    def initialize
        myDisplay = XML_display_ui.new
        myDisplay.show
    end
end
