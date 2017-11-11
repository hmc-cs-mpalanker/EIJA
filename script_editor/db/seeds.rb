# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
files =["FolgerDigitalTexts_XML_Complete/MM.xml",
        "FolgerDigitalTexts_XML_Complete/Err.xml",
        "FolgerDigitalTexts_XML_Complete/MV.xml",
        "FolgerDigitalTexts_XML_Complete/Wiv.xml",
        "FolgerDigitalTexts_XML_Complete/PhT.xml",
        "FolgerDigitalTexts_XML_Complete/Tmp.xml",
        "FolgerDigitalTexts_XML_Complete/TGV.xml",
        "FolgerDigitalTexts_XML_Complete/TNK.xml",
        "FolgerDigitalTexts_XML_Complete/WT.xml",
        "FolgerDigitalTexts_XML_Complete/Tim.xml",
        "FolgerDigitalTexts_XML_Complete/Tit.xml",
        "FolgerDigitalTexts_XML_Complete/Tro.xml",
        "FolgerDigitalTexts_XML_Complete/TN.xml",
        "FolgerDigitalTexts_XML_Complete/Ven.xml",
        "FolgerDigitalTexts_XML_Complete/H5.xml",
        "FolgerDigitalTexts_XML_Complete/1H6.xml",
        "FolgerDigitalTexts_XML_Complete/2H6.xml",
        "FolgerDigitalTexts_XML_Complete/3H6.xml",
        "FolgerDigitalTexts_XML_Complete/H8.xml",
        "FolgerDigitalTexts_XML_Complete/JC.xml",
        "FolgerDigitalTexts_XML_Complete/Jn.xml",
        "FolgerDigitalTexts_XML_Complete/Lr.xml",
        "FolgerDigitalTexts_XML_Complete/LLL.xml",
        "FolgerDigitalTexts_XML_Complete/Luc.xml",
        "FolgerDigitalTexts_XML_Complete/Mac.xml",
        "FolgerDigitalTexts_XML_Complete/MM.xml",
        "FolgerDigitalTexts_XML_Complete/Ado.xml",
        "FolgerDigitalTexts_XML_Complete/Oth.xml",
        "FolgerDigitalTexts_XML_Complete/Per.xml",
        "FolgerDigitalTexts_XML_Complete/R2.xml",
        "FolgerDigitalTexts_XML_Complete/R3.xml",
        "FolgerDigitalTexts_XML_Complete/Rom.xml",
        "FolgerDigitalTexts_XML_Complete/Son.xml",
        "FolgerDigitalTexts_XML_Complete/Shr.xml",
        "FolgerDigitalTexts_XML_Complete/MND.xml",
        "FolgerDigitalTexts_XML_Complete/MND.xml",
        "FolgerDigitalTexts_XML_Complete/AWW.xml",
        "FolgerDigitalTexts_XML_Complete/Ant.xml",
        "FolgerDigitalTexts_XML_Complete/AYL.xml",
        "FolgerDigitalTexts_XML_Complete/Cor.xml",
        "FolgerDigitalTexts_XML_Complete/Cym.xml",
        "FolgerDigitalTexts_XML_Complete/Ham.xml",
        "FolgerDigitalTexts_XML_Complete/1H4.xml",
        "FolgerDigitalTexts_XML_Complete/2H4.xml"]









files.each do |file|
  doc = Nokogiri::XML(File.open(file))
  title = doc.css('title').first
  play = Play.create(title: title.inner_text)

  currAct = 1
  currScene = 1
  currIndex = 1
  acts= doc.css('//div1')
  acts.each do |act|
    newact = play.acts.create(number: currAct)
    currAct = currAct + 1
    currScene = 1
    scenes = Nokogiri::XML(act.to_s).css('//div2')
    scenes.each do |scene|
      newscene = newact.scenes.create(number: currScene)
      currScene = currScene + 1
      lines = Nokogiri::XML(scene.to_s).css('//sp')
      stages = Nokogiri::XML(scene.to_s).css('stage').to_a
      stages.each do |stage|
        stageN = stage.attr('xml:id').to_s.gsub("stg-","").to_f
        newstage = newscene.lines.create(number: stageN, speaker: "STAGE", isStage: true)
        newstage.words.create(text: stage.inner_text, place: 0)
      end
      lines.each do |line|
        speaker = Nokogiri::XML(line.to_s).css('speaker')
        milestones = Nokogiri::XML(line.to_s).css('milestone')
        spwords = Nokogiri::XML(line.to_s).css('w','c','pc')
        milestones.each do |ms|
          lineNum = ms.attr("n").to_s.split(".")[2]
          wordIDs = ms.attr("corresp").to_s.split(" ")
          wordIDs = wordIDs.map { |w| w.gsub("#","")}
          allthewords = ""
          wordPlace = 0
          newline = newscene.lines.create(number: lineNum, speaker: speaker.inner_text)
          toTextAdd = ""
          toPlaceAdd = 0
          wordIDs.each do |id|
            spwords.each do |word|
              if word.attr('xml:id').to_s == id
                if (word.inner_text == " ")
                  passvvar = ""
                elsif (word.inner_text =~ /[[:alpha:]]/)
                  if (toTextAdd != "")
                    newline.words.create(text: toTextAdd, place: wordPlace)
                  end
                  toTextAdd = word.inner_text
                  toPlaceAdd = wordPlace + 1
                  #allthewords = allthewords + word.inner_text
                  wordPlace = wordPlace + 1
                else
                  toTextAdd = toTextAdd + word.inner_text
                end
              end
            end
          end
          if (toTextAdd != "")
            newline.words.create(text: toTextAdd, place: wordPlace)
          end
        end
      end
    end
  end
end

play = Play.find(1)
edit = play.edits.create()
# Act.joins(:play).where(:play_id => play.id).order(:number).each do |act|
#   Scene.joins(:act).where(:act_id => act.id).order(:number).each do |scene|
#     Line.joins(:scene).where(:scene_id => scene.id).order(:number).each do |line|
#       Word.joins(:line).where(:line_id => line.id).order(:place).each do |word|
#         Cut.create(edit_id: edit.id, word_id: word.id)
#       end
#     end
#   end
# end
