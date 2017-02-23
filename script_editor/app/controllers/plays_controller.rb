class PlaysController < ApplicationController
  def show
  	render template: "plays/#{params[:play]}"
  end

end
