class AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :class => AdminController
  layout "dashboard"

  def index
  end

  def grafico_reportes
  	@reclamos = Reclamo.joins(:tipo_reclamo).group('tipo_reclamos.nombre').count
  end
end
