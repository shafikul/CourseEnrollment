json.array!(@stores) do |store|
  json.extract! store, :id, :user_id, :semester_id, :course_id, :cgpa
  json.url store_url(store, format: :json)
end
