#ui/layout/ui_layout.rb

module Layout
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
    
    def createMainWindow
        
        @root  = TkRoot.new{
        title "XML to CSV"
        padx 10
        pady 10
        background "white"
        }
        
        myicon = TkPhotoImage.new('file' => (File.dirname(__FILE__) + '/images/xml_parser.gif') )
        @root.iconphoto(myicon)
    
        @root.geometry("500x200+300+200")
    
        @frame = TkFrame.new(@root){
        background "white"
        }
    end
    
    def init_tk_content
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
end
