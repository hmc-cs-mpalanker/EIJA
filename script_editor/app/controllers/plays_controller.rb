require 'nokogiri'

class PlaysController < ApplicationController
  def show

	doc2 = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MND.xml"))

	currentSpeaker = "default"

	doc2.css('w').each do |node|
  		children = node.children

  		if (children.inner_text == children.inner_text.upcase)
  			if (children.inner_text.length > 1 and not(children.inner_text == "ACT"))

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
