json.partial! 'api/v1/shared/status', message: nil, keyword: nil
json.student do
  json.id                   @student.id
  json.student_id           @student.student_id
  json.first_name           @student.first_name
  json.last_name            @student.last_name

  json.courses @courses do |course|
    json.partial! 'api/v1/courses/course', course: course
  end
end
