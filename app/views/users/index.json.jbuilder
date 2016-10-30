json.array!(@users) do |user|
  json.extract! user, :id, :descripcion
  json.url user_url(user, format: :json)
end
