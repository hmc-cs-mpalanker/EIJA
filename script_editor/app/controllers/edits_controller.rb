require 'nokogiri'

class EditsController < ApplicationController
  def show
    @edit = Edit.find(params[:id])
    @play = @edit.play
    @acts = Act.joins(:play).where(:play_id => @play.id).order(:number)
  end
end
