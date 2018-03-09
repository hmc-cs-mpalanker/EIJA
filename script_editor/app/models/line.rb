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
  # revised output: [[Speaker, lines]]
  # act -> multiple scenes -> lines -> words
  # lines -> [[wordId,word]]
  def getLines

    all_lines = Hash.new
    # all the scenes in the play
    scenes = Scene.all

    # key as a tuple
    arr = []
    scenes.each_with_index do |item1, index1|

      s = scenes[index1]

      aId = s.act_id
      sID = s.id

      arr = [aId, sID]

      # all the lines with the same Scene ID
      lines = Line.where(:scene_id => sID)

      lines_per_scene = []
      index_lines_per_scene = 0

      # all the lines for a scene
      lines.each_with_index do |item2, index2|

        # a given line
        line = lines[index2]
        l_index = line.id

        wds = []
        if line.currLength != 0
          # all the words on a given line
          words = Word.where(:line_id => l_index)

          words.each_with_index do |item3, index3|
            wd = words[index3]

            # not in the Cuts table
            if Cut.where(:word_id => wd.id).length == 0
              wds.append(wd.text)
            end
          end
          speaker = line.speaker
          str = wds.join(" ")

          if index_lines_per_scene == 0
            lines_per_scene.append([speaker, [str]])

          else
            if lines_per_scene[index_lines_per_scene - 1][0] == speaker
              lines_per_scene[index_lines_per_scene - 1][1].append(str)

            else
              lines_per_scene.append([speaker, [str]])
            end
            # lines_per_scene.append(wds.join(" "))

            index_lines_per_scene += 1

          end
        end
        all_lines[arr] = lines_per_scene
      end


    end

    return all_lines
  end


  # a_line = []
  # many_lines = [a_line]
  # a_pair = [spk,many_lines]
  # all_pairs = [a_pair]
  def getActScene(act, scene)

    index = 0
    # list of [speaker, many lines]
    all_pairs = []

    lines = Line.where(:scene_id => scene)
    lines.each do |l|
      # speaker, many lines
      a_pair = []

      many_lines = []
      # the line is not cut
      if l.currLength != 0
        spk = l.speaker

        # elements are [wordID, text]
        a_line = []

        words = Word.where(:line_id => l.id)

        words.each do |wd|
          if Cut.where(:word_id => wd.id).length == 0
              a_line.append([wd.id,wd.text])
          end
        end

        many_lines.append(a_line)
        # a_pair.append(spk)
        # a_pair.append(many_lines)
        # all_pairs.append(a_pair)

        if index != 0
          prev_pair = all_pairs[all_pairs.length-1]


            prev_speaker = prev_pair[0]
            # puts "#{prev_speaker}"
            if prev_speaker == spk
              prev_pair[1].append(a_line)
            else
              # make a new pair
              a_pair.append(spk)
              a_pair.append(many_lines)

              all_pairs.append(a_pair)
            end

        else
          a_pair.append(spk)
          a_pair.append(many_lines)
          all_pairs.append(a_pair)
        end

      end
        index+=1
      # puts "#{all_pairs}"
    end

    return all_pairs
  end


end


# l = Line.new
# l.getLines