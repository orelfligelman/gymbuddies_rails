class ButtsController < ApplicationController
  before_action :set_butt, only: [:show, :edit, :update, :destroy]

  # GET /butts
  # GET /butts.json
  def index
    @butts = Butt.all
  end

  # GET /butts/1
  # GET /butts/1.json
  def show
  end

  # GET /butts/new
  def new
    @butt = Butt.new
  end

  # GET /butts/1/edit
  def edit
  end

  # POST /butts
  # POST /butts.json
  def create
    @butt = Butt.new(butt_params)

    respond_to do |format|
      if @butt.save
        format.html { redirect_to @butt, notice: 'Butt was successfully created.' }
        format.json { render :show, status: :created, location: @butt }
      else
        format.html { render :new }
        format.json { render json: @butt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /butts/1
  # PATCH/PUT /butts/1.json
  def update
    respond_to do |format|
      if @butt.update(butt_params)
        format.html { redirect_to @butt, notice: 'Butt was successfully updated.' }
        format.json { render :show, status: :ok, location: @butt }
      else
        format.html { render :edit }
        format.json { render json: @butt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /butts/1
  # DELETE /butts/1.json
  def destroy
    @butt.destroy
    respond_to do |format|
      format.html { redirect_to butts_url, notice: 'Butt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_butt
      @butt = Butt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def butt_params
      params.require(:butt).permit(:name, :location, :fart, :shape, :percentbodysize)
    end
end
