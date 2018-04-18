require 'nokogiri'
require 'open-uri'
class EditsController < ApplicationController
  before_action :authenticate_user!

  # before_filter :set_current_play_id
  #
  # def set_current_play_id
  #   #  set @current_account from session data here
  #   Line.curr_play_id = params[:id]
  # end


  def show


    a = Scene.new
    # ENSURE THIS IS THE PLAY ID
    # this is the main view to look at the edit mode
    # so we make changes here
    cookies[:play_id] = params[:id]
    puts "THE PLAY ID IS: #{cookies[:play_id]}"

    @edit = Edit.find(params[:id])

    l = Line.new
    @hash = l.countAnalytics(cookies[:play_id])

    # So there is a reason why this was hard code
    # it is namily becuse we want to load the first act
    # of the play here not the whole play thats like the
    # point of what we have been doing.
    @scene = l.renderActScene(cookies[:play_id],1)
    puts "#{a.getAllActScenes}"
 end

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
