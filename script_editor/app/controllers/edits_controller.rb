require 'nokogiri'

class EditsController < ApplicationController
  def show
    @edit = Edit.find(params[:id])
    @play = @edit.play
    @acts = Act.joins(:play).where(:play_id => @play.id).order(:number)
  end
  def new
    @play = Play.find(params[:id])
    @user = current_user
    @edit = Edit.create({:user_id => @user.id, :play_id => @play.id})
    @link = "/edits/" + (@edit.id.to_s)
    redirect_to @link
  end
end
