require 'nokogiri'

class PlaysController < ApplicationController
  def show
    @play = Play.find(params[:id])
    @acts = Act.joins(:play).where(:play_id => @play.id).order(:number)
    @edit = Edit.find(1)
  end
end
