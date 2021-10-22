require "spec_helper"
 
module TicTacToe
  describe Player do
    context "#initialize" do
 
      it "raises an exception when initialized with {}" do
        expect { Player.new({}) }.to raise_error
      end
 
    end
  end
end