class CutsController < ApplicationController
  def new
  	Cut.create(edit_Id: params[:editI],word_Id: params[:wordI])
  end
  def delete
  	Cut.where(edit_Id: params[:editI],word_Id: params[:wordI]).first.delete
  end
end
