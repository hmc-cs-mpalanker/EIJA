class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  # def index
  #   @lines = Line.all
  # end

  # GET /lines/1
  # GET /lines/1.json
  def show
    # @edit = Edit.find(params[:id])
    l = Line.new
    @hash = l.getAllSpeakers
  end

  # required stub for the lines/show route to work
  def set_line

  end

  def script

    l = Line.new

    @hash = l.getAllSpeakers
    key = params[:id]

    puts "THE HASH CLASS IS: #{@hash.class}"
    puts "THE HASH IS:#{@hash} "

    puts "THE KEY CLASS IS: #{key.class}"
    puts "THE KEY IS:#{key} "

    # k = "#{key}"
    k = key.to_s

    # puts "HMMM::: #{k == key}"
    # puts "HMMM::: #{k.class == "EGEON".class}"
    key = key.gsub(" ","")
    # puts "THE EQUALITY:: #{key == "EGEON"}"
    #
    # puts "DOES THE KEY EXIST: #{@hash.key?(key)}"
    # puts "DOES THE KEY EXIST: #{@hash.key?("EGEON")}"
    # puts "THE NEW KEY VAL IS: #{k}"

    val = @hash[key]

    puts "THE VALUE class IS: #{val.class}"
    puts "THE VALUE IS:#{val} "


    @blocks = l.getCueScript(1,"\nEGEON\n")


  end

  # # GET /lines/new
  # def new
  #   @line = Line.new
  # end
  #
  # # GET /lines/1/edit
  # def edit
  # end
  #
  # # POST /lines
  # # POST /lines.json
  # def create
  #   @line = Line.new(line_params)
  #
  #   respond_to do |format|
  #     if @line.save
  #       format.html { redirect_to @line, notice: 'Line was successfully created.' }
  #       format.json { render :show, status: :created, location: @line }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @line.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /lines/1
  # # PATCH/PUT /lines/1.json
  # def update
  #   respond_to do |format|
  #     if @line.update(line_params)
  #       format.html { redirect_to @line, notice: 'Line was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @line }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @line.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /lines/1
  # # DELETE /lines/1.json
  # def destroy
  #   @line.destroy
  #   respond_to do |format|
  #     format.html { redirect_to lines_url, notice: 'Line was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_line
  #     @line = Line.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def line_params
  #     params.fetch(:line, {})
  #   end
end
