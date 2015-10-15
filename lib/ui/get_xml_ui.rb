#Xml_input.rb
require 'tk'
require './business/peripheral/open_browser.rb'

class XML_display_ui
@root
@frame

@header_label
@main_text
@button_open_file
@button_open_CSV_file
@button_open_CSV_file_trans


  def initialize()
    @root  = TkRoot.new{
    title "XML to CSV"
    padx 10
    pady 10
    background "white"
    }
    
    @root.geometry("500x200+300+200")
    
    @frame = TkFrame.new(@root){
    background "white"
    }
    
    populate()
  end
  
  def showPopUp
    @button_open_file.bind("1"){
      get_file_popup(1)
      break
    }
    
    @button_open_CSV_file.bind("1"){
      get_file_popup(2)
      break
    }
    
    @button_open_CSV_file_trans.bind("1"){
      get_file_popup(3)
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
      width 50
      height 5
      padx 10
      pady 10
      background "white"
      borderwidth 1
      relief "sunken"
      }
      
    
    @button_open_file = TkButton.new(@frame){text "Load XML"}
    @button_open_CSV_file = TkButton.new(@frame){text "CSV: original XML"}
    @button_open_CSV_file_trans = TkButton.new(@frame){text "CSV: translated XML"}
  end
  
  def setGridLayout
    @frame.grid(:column=>0, :row=>0, :sticky=>'nsew')
    @header_label.grid( :column=>0, :row=> 0, :sticky=>'nsew')
    @main_text.grid( :column=>0, :row=>1, :columnspan=>2, :rowspan=>1, :sticky=>'w', :padx=>15,:pady=>15)
    @button_open_file.grid(:column=>2, :row=>2, :columnspan=>1, :rowspan=>1, :sticky=>'es')
    @button_open_CSV_file.grid(:column=>0, :row=>2, :columnspan=>1, :rowspan=>1, :sticky=>'es')
    @button_open_CSV_file_trans.grid(:column=>1, :row=>2, :columnspan=>1, :rowspan=>1, :sticky=>'es')
    
    TkGrid.columnconfigure(@root, 0, :weight=>1)
    TkGrid.rowconfigure(@root, 0, :weight=>1)
    
    TkGrid.columnconfigure(@frame, 0, :weight=>1)
    TkGrid.rowconfigure(@frame, 0, :weight=>1)
    
    #head label with title
    TkGrid.columnconfigure(@header_label, 0, :weight=>1)
    TkGrid.rowconfigure(@header_label, 0, :weight=>1)
    
    #main text to display full filename
    TkGrid.columnconfigure(@main_text, 1, :weight=>1)
    TkGrid.rowconfigure(@main_text, 1, :weight=>1)
    
    #submit file button
    TkGrid.columnconfigure(@button_open_file, 2, :weight=>2)
    TkGrid.rowconfigure(@button_open_file, 2, :weight=>2)
  end
  
  def openFile(type=0, filename)
    message = ""
    if(type==0)
        message = "CSV file created: " + filename
    elsif(type==1)
        message = "XML file created: " + filename
    end
    @main_text.text = message
    @main_text.configure({'width'=>'0', 'wraplength'=>'350'})
    childLab = TkButton.new(@frame){
        text "Open File" 
        fg "blue"
    }

    childLab.bind("1"){
        Open_browser.getOS(filename)
    }
    
    childLab.grid(:column=>2, :row=>1)
  end
  
    def get_file_popup(type=1)
    fileTypes = (type==1) ? [["xml_files", "*.xml"]] : [["csv_files", "*.csv"]]
    filename = Tk.getOpenFile('filetypes'=>fileTypes, 'parent'=>@frame)
    
    if(type==1)
    #xml file type
        data = ""
        if(File.readable?(filename))
            fileOpened = File.open(filename, "r")
            data = fileOpened.read
            fileOpened.close
        end
        
        if((data !=nil)||(data!=""))
            processor = Element_editor.new(data, File.dirname(filename))
            processor.put_in_csv
        
            if(File.readable?(processor.getCSV_filename))
                openFile(0, processor.getCSV_filename)
            end
        end
    elsif(type==2)
        require './business/Csv_to_xml_parser.rb'
        #original
        if(Csv_to_xml_parser.convertToXML(filename))
            @main_text.text = Csv_to_xml_parser.getXML_rows(filename, 0)
            openFile(1, @main_text.text)
        end
    else
    #csv file type clicked
        require './business/Csv_to_xml_parser.rb'
        #translated
        if(Csv_to_xml_parser.convertToXML(filename))
            @main_text.text = Csv_to_xml_parser.getXML_rows(filename, 1)
            openFile(1, @main_text.text)
        end
    end
    
    return
  end
  
  def show
    Tk.mainloop
  end
end

#myDisplay = XML_display_ui.new
#myDisplay.show
