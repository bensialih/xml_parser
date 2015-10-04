#deletes xml header as the filename states
 module Delete_xml
    public
    module_function
    def self.deleteInitialXml(full_text)
        
        xmlTag = full_text.gsub(/\<\?xml.*?>/, '')
        strHolder = xmlTag
        if(xmlTag.strip!=nil)
            xmlTag
        else
            strHolder
        end
        
        full_text
    end
    
    def self.remove_tag_specific(full_text, tagR)
        searchRegex = /<#{tagR} .*\>/
        extractedEle = full_text.slice(searchRegex)
    
        puts "gsub works just fine #{extractedEle}"
        if((extractedEle!=nil)||full_text!=nil)
        other = ""
        puts full_text
        #other = @full_text.gsub(extractedEle, "")
        full_text = other.strip
        case tagR
            when "string"
            @strings << extractedEle
            when "string-array"
            @string_arrays << extractedEle
            when "plurals"
            @plurals << extractedEle
            else
        end
              
        return (other!="")
        else
            return false
        end
    end
    
    def self.deleteXMLTag(full_text, tag)
    if(tag.downcase=="resources")
      full_text = full_text.gsub(/\<#{tag}.*>/, '')
      full_text = full_text.gsub(/\<\/#{tag}.*>/, '')
      
      full_text
    end
  end
end
