class IndexController < ApplicationController
  
  def index

  	#Tomo todos los reclamos y los ordeno por mas valor
  	@reclamos_destacados = Reclamo.select("reclamos.*, count(reclamos.id) as valoracion").joins('INNER JOIN reclamo_usuarios ON reclamos.id = reclamo_usuarios.reclamo_id')
  	.group('reclamos.id').order("valoracion DESC, fecha DESC")  	

  	#Tomo todos los reclamos y los ordeno por fecha
  	@ultimos_reclamos = Reclamo.order(fecha: :desc)
  end
end
