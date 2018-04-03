class Average < ApplicationRecord
  belongs_to :course

  def self.calculate_averages(course_id)
    @course = Course.find(course_id)
    @course.averages.destroy_all

    @assignments = @course.assignments

    @assignments = @assignments.select{|a| a.graded == true}

    @assignments = @assignments.sort_by{|item| item.timestamp}

    puts(@assignments)
    @course.transaction do
      @assignments.each_with_index do |assignment, index|
        @average = self.calculate_average(@assignments[0, index+1])
        puts(@average)
        params = {timestamp: assignment.timestamp, average: @average, course_id: course_id}
        Average.create(params)
      end
    end
  end

  def self.calculate_average(assignments_array)
    total_points = 0
    assignments_array.each do |assignment|
      total_points += assignment.max_score
    end
    average = 0
    assignments_array.each do |assignment|
      average += ((assignment.score.to_f / assignment.max_score) * (assignment.max_score.to_f / total_points))
    end
    return (average * 100.0).to_i
  end
end
