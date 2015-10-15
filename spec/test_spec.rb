require 'testMe'
describe TestMe, "#score" do
    context "with no strikes or spares" do
        it "sums the pin count for each roll" do
            bowling = TestMe.new
            20.times {bowling.hitPins(4)}
            expect(bowling.score).to eql(80)
        end
    end
end
