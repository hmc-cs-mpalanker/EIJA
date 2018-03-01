class Line < ApplicationRecord
  belongs_to :scene
  has_many :edits, through: :line_cuts
  has_many :words

  # count the number of lines per character
  # output: A Hash, key is the speaker, value is the number of lines
  def countAnalytics
    lines_per_character = Hash.new

    lines = Line.all

    count = 0

    lines.each do |line|

      if line.currLength != nil && line.currLength > 0
        # count += 1
        # puts "HAHAHAHHAHAHAHAH"


      # if lines.currLength != nil && lines.currLength == 0
        # the line is not cut
        if lines_per_character.has_key?(line.speaker)
          lines_per_character[line.speaker] += 1
        else
          lines_per_character[line.speaker] = 1
          end
        end
      # end
    end

    # puts "MUFAKA .... #{count}"
    puts "#{lines_per_character}"
    puts "The size of the hash is: #{lines_per_character.size}"
    return lines_per_character
  end


end
