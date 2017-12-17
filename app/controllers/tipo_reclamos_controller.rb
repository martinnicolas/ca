class TipoReclamosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tipo_reclamo, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  layout "dashboard"
  
  # GET /tipo_reclamos
  # GET /tipo_reclamos.json
  def index
    @tipo_reclamos = TipoReclamo.all    
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "reporte_tipos_de_reclamo.pdf",          
          template: "tipo_reclamos/reporte_tipos_de_reclamo.html.erb"
      end
    end
  end

  # GET /tipo_reclamos/1
  # GET /tipo_reclamos/1.json
  def show
  end

  # GET /tipo_reclamos/new
  def new
    @tipo_reclamo = TipoReclamo.new
  end

  # GET /tipo_reclamos/1/edit
  def edit
  end

  # POST /tipo_reclamos
  # POST /tipo_reclamos.json
  def create
    @tipo_reclamo = TipoReclamo.new(tipo_reclamo_params)

    respond_to do |format|
      if @tipo_reclamo.save
        format.html { redirect_to @tipo_reclamo, notice: 'Se ha creado un nuevo Tipo de Reclamo.' }
        format.json { render :show, status: :created, location: @tipo_reclamo }
      else
        format.html { render :new }
        format.json { render json: @tipo_reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_reclamos/1
  # PATCH/PUT /tipo_reclamos/1.json
  def update
    respond_to do |format|
      if @tipo_reclamo.update(tipo_reclamo_params)
        format.html { redirect_to @tipo_reclamo, notice: 'Se ha actualizado el Tipo de reclamo.' }
        format.json { render :show, status: :ok, location: @tipo_reclamo }
      else
        format.html { render :edit }
        format.json { render json: @tipo_reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_reclamos/1
  # DELETE /tipo_reclamos/1.json
  def destroy
    @reclamos = Reclamo.where(tipo_reclamo_id: @tipo_reclamo.id)
    if !@reclamos.empty?
      @tipo_reclamo.destroy
      mensaje = "El tipo de reclamo tiene reclamos asociados!"
    else
      mensaje = "Se ha eliminado el Tipo de reclamo"
    end
    respond_to do |format|
      format.html { redirect_to tipo_reclamos_url, notice: 'Se ha eliminado el Tipo de reclamo.' }
      format.json { head :no_content }
    end
  end

  private
  	# Use callbacks to share common setup or constraints between actions.
    def set_tipo_reclamo
      @tipo_reclamo = TipoReclamo.find(params[:id])
    end

    def tipo_reclamo_params
      params.require(:tipo_reclamo).permit(:nombre)
    end
end

