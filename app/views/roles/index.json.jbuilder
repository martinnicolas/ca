json.array!(@roles) do |role|
  json.extract! role, :id, :descripcion
  json.url role_url(role, format: :json)
end
