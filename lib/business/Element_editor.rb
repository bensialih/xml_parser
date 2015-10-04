#lib/busines/Element_editor.rb

require './business/Delete_xml'


class Element_editor
include Delete_xml

@full_text
attr_reader :strings, :string_arrays, :plurals
  #require './business/Delete_xml'
  
  def initialize(fullText)
    @full_text = fullText
    @strings = []
    @string_arrays = []
    @plurals = []
    delete_useless_tags
  end
  
  def delete_useless_tags
    @full_text = Delete_xml.deleteInitialXml(@full_text)
    @full_text = Delete_xml.deleteXMLTag(@full_text, "resources")
  end
  
  def getString_arrays(tagSearched)
    #this gets string-array in .xml document
    startSearchRegex = /<#{tagSearched} .*\>/
    endSearchRegex = /<\/#{tagSearched}.*\>/
    
    searchTag = /\<#{tagSearched}\s(.*?)\s\<\/#{tagSearched}\>/
    
    puts @full_text["/<#{tagSearched} .*\>(.*)/<\/#{tagSearched}.*\>"]
    
    startPosition = @full_text.index(startSearchRegex) #start position of what we are looking for
    endTag = @full_text.slice(endSearchRegex) #extract the actual tag from full string
    
    
  end
  
  def testFunction
    #delete on launch
    if(startPosition!=nil && endTag!=nil)
      endPosition = @full_text.index(endTag) + endTag.length #start tag position and length of tag
      puts extractedEle = @full_text.slice(startPosition, endPosition)
    else  
      puts startPosition
      puts endTag
      puts "done"
    end
  end
  
  def getFullText
    @full_text
  end
  
  def getChildren
  end
end
