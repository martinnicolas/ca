require 'test_helper'

class ReclamosControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @reclamo = reclamos(:one)
  end

  test "should get index" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    get :index
    assert_response :success
    assert_not_nil assigns(:reclamos)
  end

  test "should get new" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    get :new
    assert_response :success
  end

  test "should create reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    assert_difference('Reclamo.count') do
      post :create, reclamo: { descripcion: @reclamo.descripcion, fecha: @reclamo.fecha, imagen: @reclamo.imagen, tipo_reclamo_id: @reclamo.tipo_reclamo_id, titulo: @reclamo.titulo, ubicacion_id: @reclamo.ubicacion_id, user_id: @reclamo.user_id }
    end

    assert_redirected_to reclamo_path(assigns(:reclamo))
  end

  test "should show reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    get :show, id: @reclamo
    assert_response :success
  end

  test "should get edit" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    get :edit, id: @reclamo
    assert_response :success
  end

  test "should update reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    patch :update, id: @reclamo, reclamo: { descripcion: @reclamo.descripcion, fecha: @reclamo.fecha, imagen: @reclamo.imagen, tipo_reclamo_id: @reclamo.tipo_reclamo_id, titulo: @reclamo.titulo, ubicacion_id: @reclamo.ubicacion_id, user_id: @reclamo.user_id }
    assert_redirected_to reclamo_path(assigns(:reclamo))
  end

  test "should destroy reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users("usuario@usuario.com"), scope: :usuario
    assert_difference('Reclamo.count', -1) do
      delete :destroy, id: @reclamo
    end

    assert_redirected_to reclamos_path
  end
end
