class Line < ApplicationRecord
  belongs_to :scene
  has_many :edits, through: :line_cuts
  has_many :words



  # Count the number of lines per character
  # output: A Hash, key is the speaker, value is the number of lines
  def countAnalytics
    lines_per_character = Hash.new

    lines = Line.all

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

    return lines_per_character
  end



  # input: the scene_id
  # output: a list of all_pairs
    # all_pairs = list of 'a_pair'
    # a_pair = list of 'speaker','many_lines'
    # many_lines = list of 'a_line'
    # a_line = list of 'wordID', 'text'
  def getActScene(scene)

    # list of [speaker, many lines]
    all_pairs = []

    lines = Line.where(:scene_id => scene)
    index = 0
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
            a_line.append([wd.id, wd.text])
          end
        end

        if a_line.length == 0
          next
        end


        if index != 0
          prev_pair = all_pairs[all_pairs.length - 1]

          prev_speaker = prev_pair[0]

          if prev_speaker == spk
            # to many_lines
            prev_pair[1].append(a_line)
          else

            many_lines.append(a_line)
            a_pair.append(spk)
            a_pair.append(many_lines)
            all_pairs.append(a_pair)
          end

        else
          # make from sratch
          many_lines.append(a_line)
          a_pair.append(spk)
          a_pair.append(many_lines)
          all_pairs.append(a_pair)
        end

      end
      index += 1
    end

    return all_pairs
  end



  # a wrapper function to get all Act, Scene pairs in the play
  # output: HashMap, key: [act_id, scene_id] is a unique pairing, value: [many_lines]

  def getAllActScenes()
    play = Hash.new
    scenes = Scene.all

    scenes.each do |scene|

      key = [scene.act_id, scene.id]

      val = getActScene(scene.id)

      play[key] = val
    end

    return play
  end


  # a helper function to print the nested structure
  # Helpful to print the data in the views in such a manner
  def printLines
    # the arg for getActScene can be changed
    # to swap data printed to terminal
    blocks = getActScene(1)

    blocks.each do |block|
      # the speaker
      puts "#{block[0]}"

      # all the lines spoken by the speaker at that instance
      lines = block[1]

      lines.each do |line|
        words = []

        line.each do |wd|
          words.append(wd[1])
        end

        str = words.join(" ")
        puts "#{str}"
      end
    end
  end


  ## Two Helper functions to support cue-scripts ##

  #input: list of "many_lines"
  # output: [speaker,[list of lines spoken]]

  def getStageScript(stage_lines)
    stage_lines.each do |sline|
      swords = []

      sline.each do |swd|
        # extra-cleaning on swd[1] as it contains \n in strings
        clean_str = swd[1].gsub(/\n/,"")
        swords.append(clean_str)
      end

      str = swords.join(" ")
      puts "#{str}"
      end
  end

  # input: list of "many_lines"
  # output: [speaker, [list of lines spoken]]
  def getSpeakerScript(speaker_lines)
    speaker_lines.each do |line|
      # for each line
      # process the list-of-lists to make sentence
      words = []
      # a line is a list of lists of wdId, text
      line.each do |wd|
        words.append(wd[1])
      end

      str = words.join(" ")
      # print the line to the terminal
      puts "#{str}"
    end
  end


  # Main function to generate a cue script

  # input: SCENE ID, Speaker (for whom to build the cue-script for)

  # output: Prints to terminal the all the lines for a given speaker
  # with "cues" :: Stage lines and last line of prev Character
  # can modularize code at the lines level

  def getCueScript(sceneID, speaker)

    blocks = getActScene(sceneID)

    (1...blocks.length).each do |i|
      # a block is a [speaker, [list of many lines]]
      prev_block = blocks[i - 1]
      curr_block = blocks[i]

      # # to get the stage cues
      if prev_block[0] == "STAGE"

        puts "#{prev_block[0]}"

        stage_lines = prev_block[1]
        getStageScript(stage_lines)

      end

      if curr_block[0] == speaker

        #### the previous speaker ####
        # do not print the stage twice!

        if prev_block[1] != "STAGE"

          # get the list of many lines
          all_prev_block_lines = prev_block[1]
          # the last line for the prev speaker
          last_line = all_prev_block_lines[all_prev_block_lines.length - 1]

          # process the list of wordID, text pairs to form the sentence
          last_line_wds = []
          last_line.each do |lol|
            last_line_wds.append(lol[1])
          end

          prev_sentence = last_line_wds.join(" ")

          # print to Screen prev_speaker and last line
          puts "#{prev_block[0]}"
          puts "#{prev_sentence}"

        end

        #### the speaker ####

        puts "#{curr_block[0]}"

        lines = curr_block[1]
        getSpeakerScript(lines)
      end
    end
  end

  # a wrapper function to generate Cue-scripts
  # Current status: print for a given sceneID and Speaker
  # Aim: to generate cue-script across all SceneIDs
  def selectCueScript
    # the scene ID
    # the speaker
    getCueScript(1,"\nEGEON\n")
  end

  # output: create a list of all speakers in the Play
  def getAllSpeaker
    speakerLst = []

    arr = Line.find_by_sql("select distinct(speaker) from Lines")

    arr.each do |i|
      speakerLst.append(i.speaker)
    end

    return speakerLst

  end

  # output: a list of all sceneIDs
  def getAllScenes
      sceneIDs = []

      scenes = Scene.all

      scenes.each do |scene|
          sceneIDs.append(scene.id)
      end

    return sceneIDs
  end

end


# l = Line.new
# l.getLines