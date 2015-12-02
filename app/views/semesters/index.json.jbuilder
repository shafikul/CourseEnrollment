json.array!(@semesters) do |semester|
  json.extract! semester, :id, :name, :type
  json.url semester_url(semester, format: :json)
end
