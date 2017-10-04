class ScratchesController < ApplicationController
  before_action :set_scratch, only: [:show, :edit, :update, :destroy]

  # GET /scratches
  # GET /scratches.json
  def index
    @scratches = Scratch.all
  end

  # GET /scratches/1
  # GET /scratches/1.json
  def show
  end

  # GET /scratches/new
  def new
    @scratch = Scratch.new
  end

  # GET /scratches/1/edit
  def edit
  end

  # POST /scratches
  # POST /scratches.json
  def create
    @scratch = Scratch.new(scratch_params)

    respond_to do |format|
      if @scratch.save
        format.html { redirect_to @scratch, notice: 'Scratch was successfully created.' }
        format.json { render :show, status: :created, location: @scratch }
      else
        format.html { render :new }
        format.json { render json: @scratch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scratches/1
  # PATCH/PUT /scratches/1.json
  def update
    respond_to do |format|
      if @scratch.update(scratch_params)
        format.html { redirect_to @scratch, notice: 'Scratch was successfully updated.' }
        format.json { render :show, status: :ok, location: @scratch }
      else
        format.html { render :edit }
        format.json { render json: @scratch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scratches/1
  # DELETE /scratches/1.json
  def destroy
    @scratch.destroy
    respond_to do |format|
      format.html { redirect_to scratches_url, notice: 'Scratch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scratch
      @scratch = Scratch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scratch_params
      params.require(:scratch).permit(:name, :items, :task_group_id)
    end
end
