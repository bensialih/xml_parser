module CleanFile
    def self.getFilePath(filepath = nil)
        checkFilePath(filepath)
    end
    
    def self.checkFilePath(filepath)
        (filepath.nil?) ? "./": filepath;
    end
end
