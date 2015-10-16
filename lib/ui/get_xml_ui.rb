#Xml_input.rb
require 'tk'
require 'business/peripheral/open_browser'
require 'ui/layout/ui_layout'
require 'ui/layout/button_popup'

class XML_display_ui
include Layout
include ButtonActions

@root
@frame

@header_label
@main_text
@button_open_file
@button_open_CSV_file
@button_open_CSV_file_trans

  def initialize()
    createMainWindow
    
    populate()
  end
  
  def populate()
    init_tk_content
    setGridLayout
    showPopUp
  end
  
  
  def show
    Tk.mainloop
  end
end
