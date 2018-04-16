require 'nokogiri'
require 'open-uri'
class EditsController < ApplicationController
  before_action :authenticate_user!


  def compress
    @edit = Edit.find(params[:id])
    @play = @edit.play
    @acts = Act.joins(:play).where(:play_id => @play.id).order(:number)
    @relCuts = Cut.where(:edit_id => @edit.id).pluck(:word_id).to_a.to_set
  end

  def new
    @play = Play.find(params[:id])

    @name = session[:user_id]
    puts 'hello'
    @user = current_user
    if Edit.where(:user_id => @user.id, :play_id => @play.id) != nil
      @edit = Edit.where(:user_id => @user.id, :play_id => @play.id).where('updated_at != created_at').order(created_at :desc)
    else
      @edit = Edit.create({:user_id => @user.id, :play_id => @play.id})
    end
    #@link = "/edits/" + (@edit.id.to_s)
    # needs to be UserId
    @link = "/edits/" + (@edit.id.to_s)
    redirect_to @link
  end

  # make an entry in the Edits table by passing the parameters
  def self.makeEdit(user_id, play_id, group_id)
    @play = Play.find(play_id)
    @edit = Edit.create({:user_id => user_id, :play_id => play_id, :groups_id => group_id})
    return @edit
  end


  # def group_edit
  #   @edit = Edit.find(params[:id])
  #   puts "#{@edit}"
  #   @play = @edit.play
  #   group_id = @edit.groups_id
  #   group_name = Group.find_by_sql(["Select name from Groups where group_id = ?",group_id])
  #   @link = "/edits/group_edit/"+ (@edit.id.to_s) + "/" + (@group_name.to_s)

  # end
end
