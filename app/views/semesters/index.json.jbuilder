json.array!(@semesters) do |semester|
  json.extract! semester, :id, :name, :semester_type
  json.url semester_url(semester, format: :json)
end
