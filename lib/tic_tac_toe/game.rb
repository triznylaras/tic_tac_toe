# frozen_string_literal: true

module TicTacToe
  # Class for set up and run the game
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return 'The game ended in a tie' if board.game_over == :draw
    end

    def board_game_over(board)
      if board.game_over
        puts game_over_message
        board.formatted_grid
        true
      else
        switch_players
        false
      end
    end

    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      loop do
        board.formatted_grid
        puts ''
        puts solicit_move
        x, y = get_move
        board.set_cell(x, y, current_player.color)
        return if board_game_over(board) == true
      end
    end

    private

    def human_move_to_coordinate(human_move)
      mapping = {}
      pos_array = [[0, 0], [1, 0], [2, 0], [0, 1], [1, 1], [2, 1], [0, 2], [1, 2], [2, 2]]
      pos_array.each_with_index do |pos, index|
        mapping[(index + 1).to_s] = pos
      end
      mapping[human_move]
    end
  end
end
