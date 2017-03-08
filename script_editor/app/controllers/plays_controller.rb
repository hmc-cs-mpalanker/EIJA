require "rexml/document"
include REXML # so that we don't have to prefix everything with REXML::...

class PlaysController < ApplicationController
  def show
  	#render template: "plays/#{params[:play]}"
  	file = File.new( "FolgerDigitalTexts_XML_Complete/MND.xml" )
	doc = Document.new file
  end
end
