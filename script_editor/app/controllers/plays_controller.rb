require 'nokogiri'

class PlaysController < ApplicationController
  def show

  	#page = Nokogiri::HTML(open("app/views/plays/show.html.erb"))
	#h5 = page.at_css "h5"
	#p = page.at_css "p"
	
	# @doc is the text in the Midsummer Nights Dream XML file
	@doc = Nokogiri::XML(File.open("FolgerDigitalTexts_XML_Complete/MND.xml"))

	# This prints what is in the XML file to Terminal
	puts @doc
	
  end
end
