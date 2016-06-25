json.array!(@reclamos) do |reclamo|
  json.extract! reclamo, :id, :imagen, :titulo, :descripcion, :fecha, :ubicacion_id, :tipo_reclamo_id, :user_id
  json.url reclamo_url(reclamo, format: :json)
end
