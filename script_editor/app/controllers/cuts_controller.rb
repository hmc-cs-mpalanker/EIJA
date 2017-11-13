class CutsController < ApplicationController
  def new
  	Cut.create(edit_id: params[:editI],word_id: params[:wordI])
  end
  def delete
  	Cut.where(edit_id: params[:editI],word_id: params[:wordI]).first.delete
  end
end
