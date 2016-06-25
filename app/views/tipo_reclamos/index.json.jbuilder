json.array!(@tipo_reclamos) do |tipo_reclamo|
  json.extract! tipo_reclamo, :id, :nombre
  json.url tipo_reclamo_url(tipo_reclamo, format: :json)
end
