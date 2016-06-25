# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'ttincho77@gmail.com', password: 'chacho77')

TipoReclamo.create(nombre: 'TRANSPORTE Y TRÁNSITO')
TipoReclamo.create(nombre: 'ESPACIOS VERDES')
TipoReclamo.create(nombre: 'PAVIMENTACIÓN Y BACHEO')
TipoReclamo.create(nombre: 'MOBILIARIO URBANO')
TipoReclamo.create(nombre: 'SEGURIDAD')
TipoReclamo.create(nombre: 'PROTECCIÓN ANIMAL')
TipoReclamo.create(nombre: 'SERVICIOS PÚBLICOS')