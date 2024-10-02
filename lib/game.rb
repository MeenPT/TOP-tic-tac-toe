# frozen_string_literal: true

require_relative 'board'
require_relative 'referee'

class Game # rubocop:disable Style/Documentation
  attr_accessor :placements, :board, :turn_count, :referee

  def initialize
    self.placements = Array.new(9)
    self.board = Board.new
    self.turn_count = 0
    self.referee = Referee.new
  end

  def start
    loop do
      render_board

      placement_index = pick_placement
      placements[placement_index] = current_player

      if referee.gameover?(placements)
        end_game
        return
      end

      self.turn_count += 1
    end
  end

  def end_game
    winner = referee.winner(placements)

    message = winner ? "#{winner} won!" : 'Tie!'

    puts "Game Over #{message}"
    exit
  end

  def current_player
    referee.current_player(turn_count)
  end

  def render_board
    board.render(placements)
  end

  def pick_placement
    current_player = referee.current_player(turn_count)
    puts "#{current_player}'s turn. Pick a cell (1 - 9)"

    placement_index = gets.chomp.to_i - 1
    is_valid = referee.valid_placement?(placement_index, placements)

    unless is_valid
      puts 'That cell is already taken. Try again'
      return pick_placement
    end

    placement_index
  end
end
