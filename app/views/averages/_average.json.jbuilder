json.extract! average, :id, :timestamp, :average, :course_id, :created_at, :updated_at
json.url course_average_url(params[:course_id], average, format: :json)
