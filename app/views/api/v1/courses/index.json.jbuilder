json.partial! 'api/v1/shared/status', message: nil, keyword: nil
json.courses @courses do |course|
  json.partial! 'api/v1/courses/course', course: course
end
