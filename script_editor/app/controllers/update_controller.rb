class UpdateController < ApplicationController
	require 'open-uri'
	respond_to :html, :json

	def new
	end

	def show
		edit = Edit.find(:editID).includes(:cuts)
		cuts = edit.cuts
		respond_to do |format|
    		cuts = 	{
			        "meta" => {
			            "playID" => "1", #should not be hardcoded
			            "editID" => "1" #Xans gon take u Xans gonna betray u
			        },
			        "payload" => { "cut" => [5,6,7],
								  "uncut" => [8,9,10]}
				    }
    		format.json  { render :json => @update} 

    	#cuts = Net::HTTP.get(URI.parse("/cuts/new"))
    	puts cuts
    	end
  	end

  	def update_cuts
  	end
end


