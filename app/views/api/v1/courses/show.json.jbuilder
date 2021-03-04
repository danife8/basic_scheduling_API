json.partial! 'api/v1/shared/status', message: nil, keyword: nil
json.course do
  json.id                   @course.id
  json.code                 @course.code
  json.title                @course.title
  json.description          @course.description

  json.students @students do |student|
    json.partial! 'api/v1/students/student', student: student
  end
end
