json.partial! 'api/v1/shared/status', message: nil, keyword: nil
json.students @students do |student|
  json.partial! 'api/v1/students/student', student: student
end
