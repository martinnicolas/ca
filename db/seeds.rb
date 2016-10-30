# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Tipo de Reclamos
# ========

TipoReclamo.create(nombre: 'TRANSPORTE Y TRÁNSITO')
TipoReclamo.create(nombre: 'ESPACIOS VERDES')
TipoReclamo.create(nombre: 'PAVIMENTACIÓN Y BACHEO')
TipoReclamo.create(nombre: 'MOBILIARIO URBANO')
TipoReclamo.create(nombre: 'SEGURIDAD')
TipoReclamo.create(nombre: 'PROTECCIÓN ANIMAL')
TipoReclamo.create(nombre: 'SERVICIOS PÚBLICOS')


# Usuarios
# ========

User.create(email: 'usuario@usuario.com', password: 'sumbudrule')
User.create(email: 'admin@admin.com', password: 'sumbudrule')

# Roles
# ========

Role.create(descripcion: 'usuario')
Role.create(descripcion: 'admin')

# UserRoles
# ========
UserRole.create(user_id: 1, role_id: 1)
UserRole.create(user_id: 2, role_id: 2)