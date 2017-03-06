class EditPlaysController < ApplicationController
  before_action :set_edit_play, only: [:show, :edit, :update, :destroy]

  # GET /edit_plays
  # GET /edit_plays.json
  def index
    @edit_plays = EditPlay.all
  end

  # GET /edit_plays/1
  # GET /edit_plays/1.json
  def show
  end

  # GET /edit_plays/new
  def new
    @edit_play = EditPlay.new
  end

  # GET /edit_plays/1/edit
  def edit
  end

  # POST /edit_plays
  # POST /edit_plays.json
  def create
    @edit_play = EditPlay.new(edit_play_params)

    respond_to do |format|
      if @edit_play.save
        format.html { redirect_to @edit_play, notice: 'Edit play was successfully created.' }
        format.json { render :show, status: :created, location: @edit_play }
      else
        format.html { render :new }
        format.json { render json: @edit_play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edit_plays/1
  # PATCH/PUT /edit_plays/1.json
  def update
    respond_to do |format|
      if @edit_play.update(edit_play_params)
        format.html { redirect_to @edit_play, notice: 'Edit play was successfully updated.' }
        format.json { render :show, status: :ok, location: @edit_play }
      else
        format.html { render :edit }
        format.json { render json: @edit_play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edit_plays/1
  # DELETE /edit_plays/1.json
  def destroy
    @edit_play.destroy
    respond_to do |format|
      format.html { redirect_to edit_plays_url, notice: 'Edit play was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edit_play
      @edit_play = EditPlay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edit_play_params
      params.require(:edit_play).permit(:play)
    end
end
