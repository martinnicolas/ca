class UbicacionsController < ApplicationController
  before_action :authenticate_user!
  
  private

    def ubicacion_params
      params.require(:ubicacion).permit(:latitud, :longitud)
    end
end

