json.partial! 'api/v1/shared/status', message: nil, keyword: nil
json.inscription do
  json.id                   @inscription.id
  json.course_id            @inscription.course_id
  json.student_id           @inscription.student_id
end
