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

        # the line is not cut
        if lines_per_character.has_key?(line.speaker)
          lines_per_character[line.speaker] += 1
        else
          lines_per_character[line.speaker] = 1
          end
        end
    end

    # puts "#{lines_per_character}"
    return lines_per_character
  end

  # key all the lines of the play that have not been cut
  # output: hash where key = [act,scene] pair and value = [lines]
  #

  # need more work
  def getLines

    all_lines = Hash.new

    scenes = Scene.all

    arr = []
    scenes.each_with_index do |item1,index1|

      s = scenes[index1]

      aId = s.act_id
      sID = s.id

      arr = [aId,sID]

      lines = Line.where(:scene_id => sID)

      lines.each_with_index do |item2, index2|
        line = lines[index2]

        l_index = line.id

        wds = []
        if line.currLength != 0
          words = Word.where(:line_id => l_index)

          words.each_with_index do |item3, index3|
            wd = words[index3].id

            if Cut.where(:word_id => wd) == 0
              wds.append(wd)
            end
          end
        end
      end
      all_lines[arr => wds]
  end

    return all_lines
  end

end


# l = Line.new
# l.getLines