class ApiRestv1Controller < ApplicationController
  include ApiRestv1Helper
  
  skip_before_action :verify_authenticity_token  
  before_filter :authenticate_request!, except: [:signin, :singup]


  #API endpoints
  
  # GET api_restv1/index
  def index
  	reclamos = Reclamo.all
  	render json: reclamos.to_json(include: [:tipo_reclamo, :ubicacion, :user])
  end

  # GET api_restv1/reclamos
  def reclamos
  	reclamos = Reclamo.where(user_id: current_user.id)
  	render json: reclamos.to_json(include: [:tipo_reclamo, :ubicacion, :user])
  end

  # GET api_restv1/tipos_reclamo
  def tipos_reclamo
  	tipos_reclamo = TipoReclamo.all
  	render json: tipos_reclamo.to_json
  end

  # GET api_restv1/reclamos/:id/valorar
  def valorar_reclamo
  	reclamo = Reclamo.find(params[:reclamo_id])
  	valoracion_existente = ReclamoUsuario.exists?(:reclamo_id => params[:reclamo_id], :user_id => params[:user_id])
    if !valoracion_existente
      reclamo_usuario = ReclamoUsuario.new
      reclamo_usuario.reclamo_id = params[:id]
      reclamo_usuario.user_id = current_user.id
      reclamo_usuario.save
      render json: reclamo.to_json(include: [:tipo_reclamo, :ubicacion, :user])
    else
      render json: {errors: ["El reclamo ya fue valorado"]}, status: :unprocessable_entity
    end
  end  

  # POST api_restv1/signin
  def signin
    user = User.find_for_database_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      sign_in(user, scope: :user) 
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
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
		    render json: { errors: "La clave confirmada no coincide con la ingresada" }, status: :unprocessable_entity
		  end
      	else
      	  render json: { errors: "Debe completar el campo confirmar clave" }, status: :unprocessable_entity	
      	end
      else
        render json: { errors: "Debe completar el campo clave" }, status: :unprocessable_entity
      end
    else
      render json: { errors: "Debe completar el campo email" }, status: :unprocessable_entity
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
