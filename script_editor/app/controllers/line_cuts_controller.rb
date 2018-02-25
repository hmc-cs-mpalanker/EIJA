class LineCutsController < ApplicationController
	# this behavior does NOT work right now -- am not passing these params in
	# lineID does not exist as a param
  def new
  	LineCut.create(edit_id: params[:editI],line_id: params[:lineId])
  end

  def delete
  	LineCut.where(edit_id: params[:editI],line_id: params[:lineId]).first.delete
  end
end
