json.array!(@ubicacions) do |ubicacion|
  json.extract! ubicacion, :id, :latitud, :longitud
  json.url ubicacion_url(ubicacion, format: :json)
end
