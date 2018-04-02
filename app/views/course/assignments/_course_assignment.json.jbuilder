json.extract! course_assignment, :id, :course_id, :timestamp, :category, :name, :graded, :late, :score, :max_score, :letter_grade, :comment, :created_at, :updated_at
json.url course_assignment_url(course_assignment, format: :json)
