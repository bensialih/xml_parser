#ui/layout/button_popup.rb

module ButtonActions
    def showPopUp
        @button_open_file.bind("1"){
        get_file_popup(1)
        break}
    
        @button_open_CSV_file.bind("1"){
        get_file_popup(2)
        break}
    
        @button_open_CSV_file_trans.bind("1"){
        get_file_popup(3)
        break}
    end
    
    def openFile(type=0, filename)
        message = ""
        if(type==0)
            message = "CSV file created: " + filename
            bind_onclick_to_file(message, filename)
        elsif(type==1)
            message = "XML file created: " + filename
            bind_onclick_to_file(message, filename)
        else
        end
    end
    
    def bind_onclick_to_file(message, filename)
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
                
                if((data !=nil)||(data!=""))
                    processor = Element_editor.new(data, File.dirname(filename))
                    processor.put_in_csv

                    if(File.readable?(processor.getCSV_filename))
                    openFile(0, processor.getCSV_filename)
                    end
                end
            end

        elsif(type==2)
            require 'business/Csv_to_xml_parser'
            #original
            if(Csv_to_xml_parser.convertToXML(filename))
                @main_text.text = Csv_to_xml_parser.getXML_rows(filename, 0)
                openFile(1, @main_text.text)
            end
        else
            #csv file type clicked
            require 'business/Csv_to_xml_parser'
            #translated
            if(Csv_to_xml_parser.convertToXML(filename))
                @main_text.text = Csv_to_xml_parser.getXML_rows(filename, 1)
                openFile(1, @main_text.text)
            end
        end
        return
    end
end
