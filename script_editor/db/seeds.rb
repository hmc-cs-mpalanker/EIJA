# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
files = ["FolgerDigitalTexts_XML_Complete/MM.xml"]
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
          wordIDs.each do |id|
            spwords.each do |word|
              if word.attr('xml:id').to_s == id
                newline.words.create(text: word.inner_text, place: wordPlace)
                #allthewords = allthewords + word.inner_text
                wordPlace = wordPlace + 1
              end
            end
          end
        end
      end
    end
  end
end

play = Play.all.first
edit = play.edits.create()
act = play.acts.first
scene = act.scenes.first
line = scene.lines.first
word = line.words.first

Cut.create(edit_id: edit.id, word_id: word.id)
