#open_browser.rb
require 'business/peripheral/os_check'
require 'business/peripheral/CleanFilepath'

module Open_browser
    extend OS
    def self.getOS(filepath = nil)
        filepath = CleanFile.getFilePath(filepath)
        if(OS.mac?)
            `open #{filepath}`
        elsif(OS.linux?)
            `gnome-open #{filepath}`
        elsif(OS.windows?)
            system("explorer file:///#{filepath}")
        else
        end
    end
end
