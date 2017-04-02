require 'nokogiri'

class PlaysController < ApplicationController
  def show

    doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MND.xml"))

    @doc2 = Nokogiri::HTML::DocumentFragment.parse <<-EOHTML
    <body>
      <h1>Three's Company</h1>
      <div>A love triangle.</div>
    </body>
    EOHTML
    h1 = @doc2.at_css "h1"
    h1.content = "Snap, Crackle & Pop"
    h1.name = 'h2'
    h1['class'] = 'show-title'

    @doc2.to_html

    #puts @doc2
    #<body>    
      #<h2 class="show-title">Snap, Crackle &amp; Pop</h2>
      #<div>A love triangle.</div>
    #</body>


    #htmldoc = Nokogiri::HTML::DocumentFragment.parse <<-EOHTML
    #<div class="act-scene-bundle">
      #<div class="act">ACT 1</div>
      #<div class="scene-container">
        #<div class="scene">SCENE 1</div>
        #<div class="scene">SCENE 2</div>
        #<div class="scene">SCENE 3</div>
      #</div>
    #</div>
    #EOHTML

    #act = htmldoc.at_css "div class='act'"
    #act.content = "WOWOMG"

    #htmldoc.to_html

    # I'm so sorry, but this was the only way because the files were named differently
    if "#{request.fullpath}" == "/plays/a_midsummer_nights_dream"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MND.xml"))
    elsif "#{request.fullpath}" == "/plays/alls_well_that_ends_well"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/AWW.xml"))
    elsif "#{request.fullpath}" == "/plays/antony_and_cleopatra"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ant.xml"))
    elsif "#{request.fullpath}" == "/plays/as_you_like_it"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/AYL.xml"))
    elsif "#{request.fullpath}" == "/plays/coriolanus"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Cor.xml"))
    elsif "#{request.fullpath}" == "/plays/cymbeline"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Cym.xml"))
    elsif "#{request.fullpath}" == "/plays/hamlet"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ham.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_iv_part_1"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/1H4.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_iv_part_2"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/2H4.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_v"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/H5.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_vi_part_1"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/1H6.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_vi_part_2"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/2H6.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_vi_part_3"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/3H6.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_viii"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/H8.xml"))
    elsif "#{request.fullpath}" == "/plays/julius_caesar"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/JC.xml"))
    elsif "#{request.fullpath}" == "/plays/king_john"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Jn.xml"))
    elsif "#{request.fullpath}" == "/plays/king_lear"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Lr.xml"))
    elsif "#{request.fullpath}" == "/plays/loves_labors_lost"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/LLL.xml"))
    elsif "#{request.fullpath}" == "/plays/lucrece"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Luc.xml"))
    elsif "#{request.fullpath}" == "/plays/macbeth"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Mac.xml"))
    elsif "#{request.fullpath}" == "/plays/measure_for_measure"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MM.xml"))
    elsif "#{request.fullpath}" == "/plays/much_ado_about_nothing"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ado.xml"))
    elsif "#{request.fullpath}" == "/plays/othello"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Oth.xml"))
    elsif "#{request.fullpath}" == "/plays/pericles"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Per.xml"))
    elsif "#{request.fullpath}" == "/plays/richard_ii"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/R2.xml"))
    elsif "#{request.fullpath}" == "/plays/richard_iii"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/R3.xml"))
    elsif "#{request.fullpath}" == "/plays/romeo_and_juliet"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Rom.xml"))
    elsif "#{request.fullpath}" == "/plays/shakespeares_sonnets"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Son.xml"))
    elsif "#{request.fullpath}" == "/plays/taming_of_the_shrew"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Shr.xml"))
    elsif "#{request.fullpath}" == "/plays/the_comedy_of_errors"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Err.xml"))
    elsif "#{request.fullpath}" == "/plays/the_merchant_of_venice"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MV.xml"))
    elsif "#{request.fullpath}" == "/plays/the_merry_wives_of_windsor"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Wiv.xml"))
    elsif "#{request.fullpath}" == "/plays/the_phoenix_and_turtle"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/PhT.xml"))
    elsif "#{request.fullpath}" == "/plays/the_tempest"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tmp.xml"))
    elsif "#{request.fullpath}" == "/plays/the_two_gentlemen_of_verona"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/TGV.xml"))
    elsif "#{request.fullpath}" == "/plays/the_two_noble_kinsmen"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/TNK.xml"))
    elsif "#{request.fullpath}" == "/plays/the_winters_tale"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/WT.xml"))
    elsif "#{request.fullpath}" == "/plays/timon_of_athens"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tim.xml"))
    elsif "#{request.fullpath}" == "/plays/titus_andronicus"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tit.xml"))
    elsif "#{request.fullpath}" == "/plays/troilus_and_cressida"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tro.xml"))
    elsif "#{request.fullpath}" == "/plays/twelfth_night"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/TN.xml"))
    elsif "#{request.fullpath}" == "/plays/venus_and_adonis"
      doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ven.xml"))
    end
    

    # These variables will change as we parse through the play
    currentPlay = doc.css('//titleStmt/title').inner_text
    currentAct = "default"
    currentScene = "default"
    currentLine = "default"
    currentWord = "default"
    currentSpeaker = "default"
    speakerNameHasTwoWords = false
    wordIsSpeaker = false


    # Loop through all of the words in the play
  	doc.css('w').each do |node|
  		children = node.children

      # This loops checks if the word is a speaker and updates currentSpeaker
  		if (children.inner_text == children.inner_text.upcase)
  			if (children.inner_text.length > 2 and not(children.inner_text == "ACT") and not(children.inner_text == "EPILOGUE"))
  				if (speakerNameHasTwoWords)
            currentSpeaker += " " + children.inner_text 
            speakerNameHasTwoWords = false
          elsif (children.inner_text == "FIRST" or children.inner_text == "SECOND" or children.inner_text == "THIRD")
            currentSpeaker = children.inner_text
            speakerNameHasTwoWords = true
          else 
            currentSpeaker = children.inner_text
          end
          wordIsSpeaker = true

        else
          wordIsSpeaker = false
  			end

      else
        wordIsSpeaker = false
      end






      #Plays.create(
        # Name of the play the word belongs to
        #:playId => doc.css('//titleStmt/title').inner_text,

        # Original number of words in the play
        #:numOriginalWords => 0,

        # Current number of lines in the play after cutting
        #:numCurrentWords => 0,
      #)

      #Scenes.create(
        # The scene number
        #:sceneId => ,

        # The act number
        #:actId => ,

        # Name of the play the scene belongs to
        #:playId => doc.css('//titleStmt/title').inner_text,

        # Original number of lines in the scene
        #:numOriginalLines => 0,
      #)

      #Lines.create(
        # Line number including act and scene number
        #:lineId => node['n'],

        # Name of the play the line belongs to
        #:playId => doc.css('//titleStmt/title').inner_text,

        # Speaker of this line
        #:speakerId => currentSpeaker

        # wordId of the first word in the line
        #:firstWord => 0,

        # wordId of the last word in the line
        #:lastWord => 0,
      #)

  		
      if (wordIsSpeaker)
    		#Speaker.create(
    			# Speaker of this word
      		#:speakerId => currentSpeaker,

          # Name of the play the speaker belongs to
          #:playId => doc.css('//titleStmt/title').inner_text, 

          # Number of words this speaker speaks in original play
          #:numOriginalWords => 0,

      		# Number of words this speaker speaks after cutting lines
      		#:numCurrentWords => 0, 		
    		#)
      else
        #Words.create(
          # Unique id of the word
          #:wordId => node['xml:id'],

          # Name of the play the word belongs to
          #:playId => doc.css('//titleStmt/title').inner_text,

          # Speaker of this word
          #:speakerId => currentSpeaker

          # Line number the word belongs to
          # Examples: "5.1.416" and "SD 1.1.0"
          #:lineId => node['n'],

          # The actual word
          #:wordText => children.inner_text,

          # Boolean representing whether or not word has been cut
          #:isCut => "false",
        #)
      end
  	end	
  end
end
