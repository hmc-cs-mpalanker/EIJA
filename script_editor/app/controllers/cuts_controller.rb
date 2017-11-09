class CutsController < ApplicationController
  def new
  	@cut = Cut.create(edit_id: params[:editI],word_id: params[:wordI])
  end
  def delete
  	@cut = Cut.where(edit_id: params[:editI],word_id: params[:wordI]).first.delete
  end
end
