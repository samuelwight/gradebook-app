json.extract! course, :id, :name, :teacher, :period, :created_at, :updated_at
json.url course_url(course, format: :json)
