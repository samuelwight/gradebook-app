class AssignmentsController < ApplicationController
  before_action :set_assignments
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET courses/1/assignments
  def index
    @assignments = @course.assignments
  end

  # GET courses/1/assignments/1
  def show
  end

  # GET courses/1/assignments/new
  def new
    @assignment = @course.assignments.build
  end

  # GET courses/1/assignments/1/edit
  def edit
  end

  # POST courses/1/assignments
  def create

    puts "Assignment params here: " + assignment_params.to_s
    temp = assignment_params
    temp['timestamp'] = Chronic.parse(assignment_params['timestamp']).to_time.to_i.to_s
    @assignment = @course.assignments.build(temp)

    if @assignment.save
      redirect_to([@assignment.course, @assignment], notice: 'Assignment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT courses/1/assignments/1
  def update
    if @assignment.update_attributes(assignment_params)
      redirect_to([@assignment.course, @assignment], notice: 'Assignment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE courses/1/assignments/1
  def destroy
    @assignment.destroy

    redirect_to course_assignments_url(@course)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignments
      @course = Course.find(params[:course_id])
    end

    def set_assignment
      @assignment = @course.assignments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assignment_params
      params.require(:assignment).permit(:course_id, :timestamp, :category, :name, :graded, :late, :score, :max_score, :letter_grade, :comment)
    end
end
