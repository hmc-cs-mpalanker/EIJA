class Line < ApplicationRecord
  belongs_to :scene
  has_many :edits, through: :line_cuts
  has_many :words

  # count the number of lines per character
  # output: A Hash, key is the speaker, value is the number of lines
  def countAnalytics
    lines_per_character = Hash.new

    lines = Line.all

    lines.each do |line|

        # the line is not cut
        if lines_per_character.has_key?(line.speaker)
          lines_per_character[line.speaker] += 1
        else
          lines_per_character[line.speaker] = 1
        end
      end

    return lines_per_character
  end

end
