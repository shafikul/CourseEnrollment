json.array!(@userdetails) do |userdetail|
  json.extract! userdetail, :id, :user_id, :line1, :line2, :city, :state, :zip, :country, :contact_no
  json.url userdetail_url(userdetail, format: :json)
end
