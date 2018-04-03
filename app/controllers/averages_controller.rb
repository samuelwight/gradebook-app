class AveragesController < ApplicationController
  before_action :set_average, only: [:show, :edit, :update, :destroy]

  # GET /averages
  # GET /averages.json
  def index
    @course = Course.find(params[:course_id])
    @averages = @course.averages
  end

  # GET /averages/1
  # GET /averages/1.json
  def show
  end

  # GET /averages/new
  def new
    @average = Average.new
  end

  # GET /averages/1/edit
  def edit
  end

  # POST /averages
  # POST /averages.json
  def create
    @average = Average.new(average_params)

    respond_to do |format|
      if @average.save
        format.html { redirect_to @average, notice: 'Average was successfully created.' }
        format.json { render :show, status: :created, location: @average }
      else
        format.html { render :new }
        format.json { render json: @average.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /averages/1
  # PATCH/PUT /averages/1.json
  def update
    respond_to do |format|
      if @average.update(average_params)
        format.html { redirect_to @average, notice: 'Average was successfully updated.' }
        format.json { render :show, status: :ok, location: @average }
      else
        format.html { render :edit }
        format.json { render json: @average.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /averages/1
  # DELETE /averages/1.json
  def destroy
    @average.destroy
    respond_to do |format|
      format.html { redirect_to averages_url, notice: 'Average was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def refresh
    Average.calculate_averages(params[:course_id])
    redirect_to course_url(params[:course_id]), notice: 'All averages have been calculated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_average
      @average = Average.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def average_params
      params.require(:average).permit(:timestamp, :average, :course_id)
    end
end
