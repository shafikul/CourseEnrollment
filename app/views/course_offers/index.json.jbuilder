json.array!(@course_offers) do |course_offer|
  json.extract! course_offer, :id, :semester_id, :course_id
  json.url course_offer_url(course_offer, format: :json)
end
