class ApiRestv1Controller < ApplicationController
  include ApiRestv1Helper
  
  skip_before_action :verify_authenticity_token  
  before_filter :authenticate_request!, except: [:signin]


  #API endpoints
  
  # GET api_restv1/reclamos
  def reclamos
  	reclamos = Reclamo.all
  	render json: reclamos.to_json(include: [:tipo_reclamo, :ubicacion])
  end

  # GET api_restv1/tipos_reclamo
  def tipos_reclamo
  	tipos_reclamo = TipoReclamo.all
  	render json: tipos_reclamo.to_json
  end

  # POST api_restv1/signin
  def signin
    user = User.find_for_database_authentication(email: params[:email])
    if user.valid_password?(params[:password])
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

  #API endpoints

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

end
