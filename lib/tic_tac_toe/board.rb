module TicTacToe
  class Board
    WINNING_LINES = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    def initialize
      @squares = Array.new(9)
    end

    def place_mark(position, mark)
      index = position - 1
      return false unless valid_position?(position) && empty_square?(index)

      squares[index] = mark
      true
    end

    def winner
      WINNING_LINES.each do |line|
        marks = line.map { |index| squares[index] }
        return marks.first if marks.first && marks.uniq.length == 1
      end

      nil
    end

    def full?
      squares.none?(&:nil?)
    end

    def draw?
      full? && winner.nil?
    end

    def render
      rows = squares.each_with_index.map { |mark, index| mark || (index + 1).to_s }.each_slice(3)

      rows.map { |row| " #{row.join(' | ')} " }.join("\n---+---+---\n")
    end

    private

    attr_reader :squares

    def valid_position?(position)
      position.between?(1, 9)
    end

    def empty_square?(index)
      squares[index].nil?
    end
  end
end
