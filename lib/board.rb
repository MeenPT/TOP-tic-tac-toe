# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  def render(placements = [])
    board_template = <<-TEXT

    1 | 2 | 3
    ---------
    4 | 5 | 6
    ---------
    7 | 8 | 9

    TEXT

    placements.each_with_index do |placement, index|
      board_template.sub!((index + 1).to_s, placement) if placement
    end

    puts board_template
  end
end
