class TipoReclamosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tipo_reclamo, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /roles
  # GET /roles.json
  def index
    @tipo_reclamos = TipoReclamo.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @tipo_reclamo = TipoReclamo.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
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

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
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

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @tipo_reclamo.destroy
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

