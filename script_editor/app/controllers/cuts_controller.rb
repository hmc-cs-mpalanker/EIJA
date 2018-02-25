class CutsController < ApplicationController
  def new
  	#  are combining new (GET) and create (POST) actions
  	@cut = Cut.create(edit_id: params[:editI],word_id: params[:wordI])

  	# get the word -> the line.id of the word -> update the length of the line with the update method
  	# this is word_id in the data-base
  	@word = @cut.word

  	@line = @word.line

  	editLength = @line.currLength - 1
  	@line.update(currLength: editLength)

  	# need to add Edit_id and Line_id NOT WORD_ID
  	if editLength == 0
  		LineCut.create(edit_id: params[:editI], line_id: @line.id)
  	end

  end

  def delete
  	# get the cut data-entry with the appropriate entries
  	#  delete it from the DB
  	Cut.where(edit_id: params[:editI],word_id: params[:wordI]).first.delete
  end
end
