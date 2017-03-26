require 'nokogiri'

class PlaysController < ApplicationController
  def show

    doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MND.xml"))


    # I'm so sorry, but this was the only way because the files were named differently
    if "#{request.fullpath}" == "/plays/a_midsummer_nights_dream"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MND.xml"))
    elsif "#{request.fullpath}" == "/plays/alls_well_that_ends_well"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/AWW.xml"))
    elsif "#{request.fullpath}" == "/plays/antony_and_cleopatra"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ant.xml"))
    elsif "#{request.fullpath}" == "/plays/as_you_like_it"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/AYL.xml"))
    elsif "#{request.fullpath}" == "/plays/coriolanus"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Cor.xml"))
    elsif "#{request.fullpath}" == "/plays/cymbeline"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Cym.xml"))
    elsif "#{request.fullpath}" == "/plays/hamlet"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ham.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_iv_part_1"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/1H4.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_iv_part_2"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/2H4.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_v"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/H5.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_vi_part_1"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/1H6.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_vi_part_2"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/2H6.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_vi_part_3"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/3H6.xml"))
    elsif "#{request.fullpath}" == "/plays/henry_viii"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/H8.xml"))
    elsif "#{request.fullpath}" == "/plays/julius_caesar"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/JC.xml"))
    elsif "#{request.fullpath}" == "/plays/king_john"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Jn.xml"))
    elsif "#{request.fullpath}" == "/plays/king_lear"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Lr.xml"))
    elsif "#{request.fullpath}" == "/plays/loves_labors_lost"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/LLL.xml"))
    elsif "#{request.fullpath}" == "/plays/lucrece"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Luc.xml"))
    elsif "#{request.fullpath}" == "/plays/macbeth"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Mac.xml"))
    elsif "#{request.fullpath}" == "/plays/measure_for_measure"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MM.xml"))
    elsif "#{request.fullpath}" == "/plays/much_ado_about_nothing"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ado.xml"))
    elsif "#{request.fullpath}" == "/plays/othello"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Oth.xml"))
    elsif "#{request.fullpath}" == "/plays/pericles"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Per.xml"))
    elsif "#{request.fullpath}" == "/plays/richard_ii"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/R2.xml"))
    elsif "#{request.fullpath}" == "/plays/richard_iii"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/R3.xml"))
    elsif "#{request.fullpath}" == "/plays/romeo_and_juliet"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Rom.xml"))
    elsif "#{request.fullpath}" == "/plays/shakespeares_sonnets"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Son.xml"))
    elsif "#{request.fullpath}" == "/plays/taming_of_the_shrew"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Shr.xml"))
    elsif "#{request.fullpath}" == "/plays/the_comedy_of_errors"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Err.xml"))
    elsif "#{request.fullpath}" == "/plays/the_merchant_of_venice"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MV.xml"))
    elsif "#{request.fullpath}" == "/plays/the_merry_wives_of_windsor"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Wiv.xml"))
    elsif "#{request.fullpath}" == "/plays/the_phoenix_and_turtle"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/PhT.xml"))
    elsif "#{request.fullpath}" == "/plays/the_tempest"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tmp.xml"))
    elsif "#{request.fullpath}" == "/plays/the_two_gentlemen_of_verona"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/TGV.xml"))
    elsif "#{request.fullpath}" == "/plays/the_two_noble_kinsmen"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/TNK.xml"))
    elsif "#{request.fullpath}" == "/plays/the_winters_tale"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/WT.xml"))
    elsif "#{request.fullpath}" == "/plays/timon_of_athens"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tim.xml"))
    elsif "#{request.fullpath}" == "/plays/titus_andronicus"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tit.xml"))
    elsif "#{request.fullpath}" == "/plays/troilus_and_cressida"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Tro.xml"))
    elsif "#{request.fullpath}" == "/plays/twelfth_night"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/TN.xml"))
    elsif "#{request.fullpath}" == "/plays/venus_and_adonis"
      doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/Ven.xml"))
    end
    

    # Variable that keeps track of who is speaking
  	currentSpeaker = "default"

  	doc2.css('w').each do |node|
  		children = node.children

      # This loop updates the current speaker whenever it changes
      # TODO: This breaks down when names are 2 or more words long
  		if (children.inner_text == children.inner_text.upcase)
  			if (children.inner_text.length > 2 and not(children.inner_text == "ACT") and not(children.inner_text == "EPILOGUE"))
  				currentSpeaker = children.inner_text 
  				puts currentSpeaker
  			end
  		end

  		#Words.create(
  			# Line number the word belongs to
  			# Examples: "5.1.416" and "SD 1.1.0"
    		#:lineNum => node['n'],

    		# The actual word
    		#:wordText => children.inner_text,

    		# Unique id of the word
    		#:wordId => node['xml:id'],

    		# Name of the play the word belongs to
    		#:playName => doc2.css('//titleStmt/title').inner_text,

    		# Boolean representing whether or not word has been cut
    		#:isCut => "False",

    		# Speaker of this word
    		#:speaker => currentSpeaker
  		#)

  		#Speaker.create(
  			# Speaker of this word
      		#:speakerId => currentSpeaker

      		# Number of words this speaker speaks
      		#:numWords => 0

      		# Unique id of the word
      		#:wordId => node['xml:id'],

      		# Name of the play the word belongs to
      		#:playName => doc2.css('//titleStmt/title').inner_text,   		
  		#)
  	end	
  end
end
