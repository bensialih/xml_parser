#csv_to_xml_parser.rb
require 'csv'
require 'htmlentities'

module Csv_to_xml_parser
@xml_string_arrays
@xml_string
@coder
    def self.convertToXML(csv_location)
        @coder = HTMLEntities.new
        content = getContent(csv_location)
    end
    
    def self.getContent(file_location)
        @xml_string_arrays = {}
        @xml_string = {}
        if(file_location!="")
            CSV.foreach(File.path(file_location)) do |csv_info|
                if(csv_info[0]=="0")
                    @xml_string["#{csv_info[1]}"] = csv_info[2], csv_info[3]
                else
                    if(@xml_string_arrays.assoc("#{csv_info[1]}")==nil)
                        @xml_string_arrays["#{csv_info[1]}"] = []
                        @xml_string_arrays["#{csv_info[1]}"].push([csv_info[2], csv_info[3]])
                    else
                        @xml_string_arrays["#{csv_info[1]}"].push([csv_info[2], csv_info[3]])
                    end
                end
            end
            return true
        else
            return false
        end
    end
    
    def self.getXML_rows(file_location, translation = 0)
    #translation original=0 translated=1
    total = ""
        @xml_string.each do |key, arr1|
            total += "<string name='#{key}' >#{ @coder.encode(arr1[translation].to_s)}</string>\n"
        end
        
        @xml_string_arrays.each do |key, arr1|
            items = ""
            arr1.each{|val| 
            items += "  <item>#{@coder.encode(val[translation].to_s)}</item>\n" 
            }
            
            total += "<string-array name=\"#{key}\" >\n#{ items}</string-array>\n"
        end
        
        new_file = "#{File.dirname(file_location)}/strings.xml"
        
        if(File.exists?(new_file))
            File.open(new_file, "w"){|file|
            file.write(total)
            }
        else
            File.open(new_file, File::WRONLY|File::CREAT|File::EXCL){|file|
            file.write(total)
            }
        end
        return new_file
    end
    
end
