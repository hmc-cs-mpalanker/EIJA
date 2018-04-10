class UpdateController < ApplicationController
	require 'open-uri'
	respond_to :html, :json


	def show
		respond_to do |format|
			#@cut_data= JSON.parse(params[:cut_data])
			#puts @cut_data
    		#words = [{word_id: 1,text: 'foo'}, {word_id: 2, text: 'bar'}, {word_id: 3, text: 'cow'}]
    		cuts = {
    					"1": 
              				{text: 'foo'}, 
    					"2": 
    						{text: 'bar'}, 
    					"3": 
    						{text: 'cow'}
    				} 
    		uncuts = {
    					"1": 
    						{text: 'me'}, 
    					"2": 
    						{text: 'you'}
    			}
    		format.json  { render :json => cuts} 
    	end
  	end

  	def update_cuts
  		params[:id].split(',').map(&:to_i).each do |id|
        Update.find(id).update params[:cuts][id]
    end
  	end
end
