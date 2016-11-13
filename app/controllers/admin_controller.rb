class AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :class => AdminController
  layout "dashboard"

  def index	  	
  	@reclamos_por_dia = Reclamo.group_by_day(:fecha,  format: "%d %b %Y").count
  end

  def grafico_reclamos
  	@reclamos_por_tipo = Reclamo.joins(:tipo_reclamo).group('tipo_reclamos.nombre').count
  end
end
