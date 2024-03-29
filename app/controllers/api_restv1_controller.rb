class ApiRestv1Controller < ApplicationController
  include ApiRestv1Helper
  
  skip_before_action :verify_authenticity_token  
  before_filter :authenticate_request!, except: [:signin, :signup]


  #API endpoints
  
  # GET api_restv1/index
  def index
  	reclamos = Reclamo.all
  	render json: reclamos.to_json(include: [:tipo_reclamo, :ubicacion, :user], methods: [:valoracion])
  end

  # GET api_restv1/reclamos
  def reclamos
  	reclamos = Reclamo.where(user_id: current_user.id)
  	render json: reclamos.to_json(include: [:tipo_reclamo, :ubicacion, :user], methods: [:valoracion])
  end

  # GET api_restv1/tipos_reclamo
  def tipos_reclamo
  	tipos_reclamo = TipoReclamo.all
  	render json: tipos_reclamo.to_json
  end

  # GET api_restv1/reclamos/:id/valorar
  def valorar_reclamo
  	reclamo = Reclamo.find(params[:reclamo_id])
    if !reclamo.valorado(current_user.id)
      reclamo_usuario = ReclamoUsuario.new
      reclamo_usuario.reclamo_id = params[:id]
      reclamo_usuario.user_id = current_user.id
      reclamo_usuario.save
      render json: reclamo.to_json(include: [:tipo_reclamo, :ubicacion, :user], methods: [:valoracion])
    else
      render json: "El reclamo ya fue valorado!", status: :unprocessable_entity
    end
  end  

  # POST api_restv1/reclamos
  def crear_reclamo
    reclamo = Reclamo.new
    reclamo.imagen = params[:imagen]
    reclamo.tipo_reclamo_id = params[:tipo_reclamo_id]
    reclamo.titulo = params[:titulo]
    reclamo.fecha = params[:fecha]
    reclamo.ubicacion = Ubicacion.new
    reclamo.ubicacion.latitud = params[:latitud]
    reclamo.ubicacion.longitud = params[:longitud]
    reclamo.descripcion = params[:descripcion]
    reclamo.user_id = current_user.id
    if reclamo.save
	  render json: reclamo.to_json(include: [:tipo_reclamo, :ubicacion, :user])
    else
      render json: {errors: reclamo.errors}, status: :unprocessable_entity
    end
  end

  # PUT/PATCH api_restv1/reclamos/:id
  def actualizar_reclamo
    reclamo = Reclamo.find(params[:id])
    reclamo.imagen = params[:imagen]
    reclamo.tipo_reclamo_id = params[:tipo_reclamo_id]
    reclamo.titulo = params[:titulo]
    reclamo.fecha = params[:fecha]
    reclamo.ubicacion = Ubicacion.new
    reclamo.ubicacion.latitud = params[:latitud]
    reclamo.ubicacion.longitud = params[:latitud]
    reclamo.descripcion = params[:descripcion]
    reclamo.user_id = current_user.id
    if reclamo.save
	  render json: reclamo.to_json(include: [:tipo_reclamo, :ubicacion, :user])
    else
      render json: {errors: reclamo.errors}, status: :unprocessable_entity
    end
  end

  # DELETE api_restv1/reclamos/:id
  def eliminar_reclamo
  	reclamo = Reclamo.find(params[:id])
  	reclamo_usuario = ReclamoUsuario.where(:reclamo_id => params[:id])
    if !reclamo_usuario.empty?
      ReclamoUsuario.destroy_all(:reclamo_id => params[:id])
    end
    ubicacion_id = reclamo.ubicacion_id
    reclamo.destroy
    Ubicacion.destroy(ubicacion_id)
    render json: reclamo.to_json(include: [:tipo_reclamo, :ubicacion, :user])
  end

  # POST api_restv1/signin
  def signin
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      sign_in(user, scope: :user)
      render json: payload(user)
    else
      render json: 'Usuario o clave incorrectos!', status: :unauthorized
    end
  end

  # POST api_restv1/signup
  def signup
    user_password = params[:password]
    user_confirm_password = params[:confirm_password]
    user_email = params[:email]
    if user_email.present? 
      if user_password.present? 
    	if user_confirm_password.present?
    	  if user_password == user_confirm_password
		    user = User.new
		    user.email = user_email
		    user.password = user_password
		    user.save
		    sign_in(user, scope: :user) 
		    render json: payload(user)
		  else
		    render json: "La clave confirmada no coincide con la ingresada", status: :unprocessable_entity
		  end
      	else
      	  render json: "Debe completar el campo confirmar clave", status: :unprocessable_entity	
      	end
      else
        render json: "Debe completar el campo clave", status: :unprocessable_entity
      end
    else
      render json: "Debe completar el campo email", status: :unprocessable_entity
    end
  end 

  

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

end
