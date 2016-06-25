class TipoReclamosController < InheritedResources::Base
  before_action :authenticate_user!
  
  private

    def tipo_reclamo_params
      params.require(:tipo_reclamo).permit(:nombre)
    end
end

