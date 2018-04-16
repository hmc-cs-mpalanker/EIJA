require 'json'


class CutsController < ApplicationController

  def new
		# at runtime can know the current User
    # userID = current_user.id
    # puts " THE USER ID IS :: #{userID}"
		cutAndUncut(params[:payload],params[:meta][:cutOrUncut],1)
  end

  def delete
  	# get the cut data-entry with the appropriate entries
  	#  delete it from the DB
  	@cut = Cut.where(edit_id: params[:editI],word_id: params[:wordI]).first.delete

		# increment the line-length
		@word = @cut.word
		@line = @word.line

		# un-cut the line from LineCut table
		# if currLength is 0
		if @line.currLength == 0
			@line.update(currLength: 1)
			LineCut.where(edit_id: params[:editI], line_id: @line.id).first.delete
		else
			editLength = @line.currLength + 1
			@line.update(currLength: editLength)
		end
	end

  # payload: the list of wordIds to cut/uncut
  # binOpt: true means to cut the word and false means to uncut
  # editId: the editId for the Cut being made :: hardcoded to 1 for now
  #         earlier params[id] was used that was constant for a given user

  def cutAndUncut(payload, binOpt, editId)

    for wordID in payload do

      if binOpt == "true"

        @cut = Cut.create(edit_id: editId,word_id: wordID)

        # update the edit
        # need to create the correct editID first
        # the groupId is the row in the Group table
        # the groupNum tells the group the user is part of
        Edit.where(user_id: current_user.id).update(groups_id: current_user.groups_id)

        # get the word -> the line.id of the word -> update the length of the line with the update method
        # this is word_id in the data-base
        @word = @cut.word
        @line = @word.line

        if @line.currLength > 0
          editLength = @line.currLength - 1
          @line.update(currLength: editLength)

          # add editId and lineId for LineCut relationship
          if editLength == 0
            # the user has an id
            # use that id to get the row in the edits table
            LineCut.create(edit_id: 1, line_id: @line.id)
          end
        end
      else
        # get the cut data-entry with the appropriate entries
        #  delete it from the DB
        @cut = Cut.where(edit_id: 1,word_id: wordID).first.delete

        Edit.where(user_id: current_user.id).update(groups_id: current_user.groups_id)

        # increment the line-length
        @word = @cut.word
        @line = @word.line

        # un-cut the line from LineCut table
        # if currLength is 0
        if @line.currLength == 0
          @line.update(currLength: 1)
          LineCut.where(edit_id: 1, line_id: @line.id).first.delete
        else
          editLength = @line.currLength + 1
          @line.update(currLength: editLength)
        end
      end
    end
  end

end
