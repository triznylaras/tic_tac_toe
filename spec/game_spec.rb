require "spec_helper"

module TicTacToe
  describe Game do

    let (:bob) { Player.new({color: "X", name: "bob"}) }
    let (:frank) { Player.new({color: "O", name: "frank"}) }

    context "#initialize" do
      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.current_player).to eq frank
      end
 
      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle) { [frank, bob] }
        game = Game.new([bob, frank])
        expect(game.other_player).to eq bob
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([bob, frank])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end
     
      it "will set @other_player to @current_player" do
        game = Game.new([bob, frank])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

    context "#solicit_move" do
      it "asks the player to make a move" do
        game = Game.new([bob, frank])
        allow(game).to receive(:current_player) { bob }
        expected = "bob: Enter a number between 1 and 9 to make your move"
        expect(game.solicit_move).to eq expected
      end
    end

    context "#get_move" do
      it "converts human_move of '1' to [0, 0]" do
        game = Game.new([bob, frank])
        expect(game.get_move("1")).to eq [0, 0]
      end
     
      it "converts human_move of '1' to [0, 0]" do
        game = Game.new([bob, frank])
        expect(game.get_move("7")).to eq [0, 2]
      end
    end
    
  end
end