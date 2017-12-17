require 'test_helper'

class TipoReclamosControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @tipo_reclamo = tipo_reclamos(:one)
  end

  test "should get index" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_reclamos)
  end

  test "should get new" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :new
    assert_response :success
  end

  test "should create tipo_reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    assert_difference('TipoReclamo.count') do
      post :create, tipo_reclamo: { nombre: @tipo_reclamo.nombre }
    end

    assert_redirected_to tipo_reclamo_path(assigns(:tipo_reclamo))
  end

  test "should show tipo_reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :show, id: @tipo_reclamo
    assert_response :success
  end

  test "should get edit" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :edit, id: @tipo_reclamo
    assert_response :success
  end

  test "should update tipo_reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    patch :update, id: @tipo_reclamo, tipo_reclamo: { nombre: @tipo_reclamo.nombre }
    assert_redirected_to tipo_reclamo_path(assigns(:tipo_reclamo))
  end

  test "should destroy tipo_reclamo" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    @reclamos = Reclamo.where(tipo_reclamo: @tipo_reclamo.id)
    if !@reclamos.empty?
      assert_difference('TipoReclamo.count', -1) do
        delete :destroy, id: @tipo_reclamo
      end
    end

    assert_redirected_to tipo_reclamos_path
  end
end
