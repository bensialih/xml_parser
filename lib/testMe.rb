class TestMe
    attr_reader :score
    def initialize
        @score = 0
    end
    
    def hitPins(pin_count)
        @score += pin_count
    end
end
