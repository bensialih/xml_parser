#lib/busines/Element_editor.rb

require_relative './Delete_xml'
require 'nokogiri'
require 'htmlentities'
require 'csv'


class Element_editor
include Delete_xml
@full_text
attr_accessor :xml_doc, :strings, :string_arrays, :plurals, :csv_file
attr_reader :filePath, :coder
  
  def initialize(fullText, file_dest)
    @filePath = file_dest
    @full_text = fullText
    @strings = Array.new
    @string_arrays = Array.new
    @plurals = Array.new
    @xml_doc = Nokogiri::XML.parse(fullText) do |config|
        config.noblanks
    end
    
    @coder = HTMLEntities.new
    get_all_arrays
  end
  
  def getStringArray
    string_ele = @xml_doc.xpath("//string")
    string_ele.map{|node|
        @strings.push [0, node['name'] , @coder.decode(node.text)]
        }
  end
  
  def getStringArray_arrays
    array_ele = @xml_doc.xpath("//string-array")
    array_ele.map{|node|
        if(node.children().length>0)
            node.children().map{|item|
            @string_arrays.push [1 , node.attributes['name'].to_s , @coder.decode(item.text)]            
            }
        end
    }
  end
  
  def getPluralsArray
    #@plurals
  end
  
  def get_all_arrays
    if(@xml_doc!=nil)
        getStringArray
        getStringArray_arrays
        getPluralsArray
    end
  end
    
  def put_in_csv
    @csv_file = @filePath + "/strings.csv"
    CSV.open(@csv_file, "wb", :row_sep=>"\n") do |csv|
        csv << ["type", "key", "value", "translation"]
        if(@strings.length>0)
            @strings.map{|x|
                csv << x
            }
        end
        if(@string_arrays.length > 0)
            @string_arrays.map{|x|
                csv << x
            }
        end
        if(@plurals.length>0)
            @plurals.map{|x|
                csv << x
            }
        end
    end
  end
  
  def getCSV_filename
    @csv_file
  end
end
