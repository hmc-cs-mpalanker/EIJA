class SceneRenderController < ApplicationController

  def show


    l = Line.new
    @scene = l.renderActScene(1,params[:id])
    # l = Line.new
    # Act.where({id: curr_scene.act_id})
    sceneQuery = Scene.where({id:Integer(params[:id])})[0]
    @scene_number = sceneQuery.number
    @act_number = Act.where({id: sceneQuery.act_id})[0].number
    @scene = Line.new.renderActScene(Integer(cookies[:play_id]),Integer(params[:id]))
    # @scene.each do |p|
    #   puts "#{p}"
    # end
    render :layout => false
  end
end
