require 'nokogiri'

class PlaysController < ApplicationController
  def show
    @play = Play.find(params[:id])
    @acts = Act.where(:play_id => @play.id).order(:number)
  end
end
