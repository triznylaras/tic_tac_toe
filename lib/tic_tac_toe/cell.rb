module TicTacToe
  # Class for initialize cell values in the board
  class Cell
    attr_accessor :value

    def initialize(value = '')
      @value = value
    end
  end
end
