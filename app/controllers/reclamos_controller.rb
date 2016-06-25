class ReclamosController < InheritedResources::Base
  before_action :authenticate_user!, :set_reclamo, only: [:show, :edit, :update, :destroy]

  # GET /reclamos
  # GET /reclamos.json
  def index
    @reclamos = Reclamo.where(:user_id => current_user.id)
  end

  # GET /reclamos/1
  # GET /reclamos/1.json
  def show
    @reclamo = Reclamo.find(params[:id])
    @reclamos_relacionados = Reclamo.where(:tipo_reclamo_id => @reclamo.tipo_reclamo_id).where.not(:id => @reclamo.id).order(:fecha)
  end

  # GET /reclamos/new
  def new
    @reclamo = Reclamo.new
  end

  # GET /reclamos/1/edit
  def edit
    @ubicacion = Reclamo.find(params[:id]).ubicacion    
  end

  # POST /reclamos
  # POST /reclamos.json
  def create  	
    @reclamo = Reclamo.new(reclamo_params)
    @reclamo.user_id = current_user.id #Relaciono al usuario conectado
    ubicacion_params = params[:ubicacion]
    ubicacion = Ubicacion.new
    ubicacion.latitud = ubicacion_params[:latitud]
    ubicacion.longitud = ubicacion_params[:longitud]
    ubicacion.save
    @reclamo.ubicacion_id = ubicacion.id    

    respond_to do |format|
      if @reclamo.save
        format.html { redirect_to @reclamo, notice: 'Se ha creado un nuevo Reclamo.' }
        format.json { render :show, status: :created, location: @reclamo }
      else
        format.html { render :new }
        format.json { render json: @reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reclamos/1
  # PATCH/PUT /reclamos/1.json
  def update  
    ubicacion_params = params[:ubicacion]
    ubicacion = Reclamo.find(params[:id]).ubicacion
    ubicacion.latitud = ubicacion_params[:latitud]
    ubicacion.longitud = ubicacion_params[:longitud]
    ubicacion.save
    @reclamo.ubicacion_id = ubicacion.id    	
    respond_to do |format|
      if @reclamo.update(reclamo_params)
        format.html { redirect_to @reclamo, notice: 'Se ha actualizado el Reclamo.' }
        format.json { render :show, status: :ok, location: @reclamo }
      else
        format.html { render :edit }
        format.json { render json: @reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @reclamo_usuario = ReclamoUsuario.where(:reclamo_id => @reclamo.id)
    if !@reclamo_usuario.empty?
      ReclamoUsuario.destroy_all(:reclamo_id => @reclamo.id)
    end
    ubicacion_id = @reclamo.ubicacion_id
    @reclamo.destroy
    Ubicacion.destroy(ubicacion_id)
    respond_to do |format|
      format.html { redirect_to reclamos_url, notice: 'Se ha eliminado el Reclamo.' }
      format.json { head :no_content }
    end
  end

  def valorar
    @reclamo = Reclamo.find(params[:id])
  	valoracion_existente = ReclamoUsuario.exists?(:reclamo_id => params[:id], :user_id => current_user.id)
    respond_to do |format|      
      if !valoracion_existente
        reclamo_usuario = ReclamoUsuario.new
       	reclamo_usuario.reclamo_id = params[:id]
       	reclamo_usuario.user_id = current_user.id
        reclamo_usuario.save
        format.html { redirect_to @reclamo, notice: 'Ahora te gusta este Reclamo.' }
        format.json { render :show, status: :ok, location: @reclamo }
      else
        format.html { render :edit }
        format.json { render json: @reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  def quitar_valor
    @reclamo = Reclamo.find(params[:id])
    valoracion_existente = ReclamoUsuario.exists?(:reclamo_id => params[:id], :user_id => current_user.id)
    respond_to do |format|
      if valoracion_existente
        ReclamoUsuario.destroy(ReclamoUsuario.where(:reclamo_id => params[:id], :user_id => current_user.id).first)
        format.html { redirect_to @reclamo, notice: 'Ya no te gusta este Reclamo.' }
        format.json { render :show, status: :ok, location: @reclamo }
      else
        format.html { render :edit }
        format.json { render json: @reclamo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  	# Use callbacks to share common setup or constraints between actions.
    def set_reclamo
      @reclamo = Reclamo.find(params[:id])
    end

    def reclamo_params
      params.require(:reclamo).permit(:imagen, :titulo, :descripcion, :fecha, :ubicacion_id, :tipo_reclamo_id, :user_id)
    end
end

