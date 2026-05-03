module TicTacToe
  class Game
    def initialize(input: $stdin, output: $stdout)
      @input = input
      @output = output
      @board = Board.new
      @players = [
        Player.new(name: 'Player 1', mark: 'X'),
        Player.new(name: 'Player 2', mark: 'O')
      ]
      @current_player_index = 0
      @quit_requested = false
    end

    def play
      output.puts 'Tic Tac Toe'
      output.puts

      until game_over? || quit_requested
        output.puts board.render
        output.puts
        take_turn
        switch_players unless game_over? || quit_requested
      end

      return if quit_requested

      output.puts board.render
      output.puts
      announce_result
    end

    private

    attr_reader :board, :input, :output, :players
    attr_accessor :current_player_index

    def current_player
      players[current_player_index]
    end

    def take_turn
      loop do
        output.print "#{current_player.name} (#{current_player.mark}), choose a square 1-9: "
        line = input.gets

        unless line
          self.quit_requested = true
          output.puts
          return
        end

        position = line.chomp.to_i

        return if board.place_mark(position, current_player.mark)

        output.puts 'That square is not available. Try again.'
      end
    end

    def switch_players
      self.current_player_index = current_player_index.zero? ? 1 : 0
    end

    def game_over?
      board.winner || board.draw?
    end

    def quit_requested
      @quit_requested
    end

    def quit_requested=(value)
      @quit_requested = value
    end

    def announce_result
      if board.winner
        output.puts "#{current_player.name} wins!"
      else
        output.puts "It's a draw!"
      end
    end
  end
end
