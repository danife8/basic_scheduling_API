json.partial! 'api/v1/shared/status', message: nil, keyword: nil
json.inscriptions @inscriptions do |inscription|
  json.partial! 'api/v1/inscriptions/inscription', inscription: inscription
end
