# frozen_string_literal: true

class Referee # rubocop:disable Style/Documentation
  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def current_player(turn_count)
    turn_count.even? ? 'X' : 'O'
  end

  def valid_placement?(placement_index, placements)
    placements[placement_index] ? false : true
  end

  def winner(placements)
    winner = nil

    WINNING_COMBINATIONS.each do |combination|
      a = combination[0]
      b = combination[1]
      c = combination[2]

      next unless placements[a] == placements[b] && placements[a] == placements[c]

      winner = placements[a]
      break
    end

    # winner could be 'X', 'O', or nil
    winner
  end

  def gameover?(placements)
    !!winner(placements) || placements.compact.length == 9
  end
end
