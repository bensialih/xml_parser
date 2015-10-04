#Xml_input.rb
require 'tk'
require './business/Element_editor.rb'

class XML_display_ui
@root
@frame

@header_label
@main_text
@button_open_file

  def initialize()
    @root  = TkRoot.new { title "Hello, World!"}
    @frame = TkFrame.new(@root){
    background "white"}
    
    populate()
    
  end
  
  def showPopUp
    @button_open_file.bind("1"){
      get_file_popup()
      break
    }
  end
  
  def populate()
    initializeContent
    setGridLayout
    showPopUp
  end
  
  def initializeContent
    @header_label = TkLabel.new(@frame){
      text "XML Parser"
      padx 2
      pady 5
      borderwidth 15
      background "white"
    }
    
    @main_text = TkLabel.new(@frame){
      width 100
      height 10
      padx 10
      pady 10
      background "white"
      borderwidth 1
      relief "sunken"
      }
    
    @button_open_file = TkButton.new(@frame){text "Load XML"}
  end
  
  def setGridLayout
    @frame.grid(:column=>0, :row=>0)
    @header_label.grid( :column=>0, :row=> 0)
    @main_text.grid( :column=>0, :row=>1, :columnspan=>3, :rowspan=>1)
    @button_open_file.grid(:column=>2, :row=>2)
  end
  
  def get_file_popup()
    fileTypes = [["xml_files", "*.xml"]]
    filename = Tk.getOpenFile('filetypes'=>fileTypes, 'parent'=>@frame)
    
    data = ""
    
    if(File.readable?(filename))
      fileOpened = File.open(filename, "r")
      data = fileOpened.read
      fileOpened.close
    end
    
    processor = Element_editor.new(data)
    puts processor.getString_arrays("string")
    return
  end
  
  def show
    Tk.mainloop
  end
end

#myDisplay = XML_display_ui.new
#myDisplay.show
