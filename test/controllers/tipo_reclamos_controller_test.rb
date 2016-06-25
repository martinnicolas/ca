require 'test_helper'

class TipoReclamosControllerTest < ActionController::TestCase
  setup do
    @tipo_reclamo = tipo_reclamos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_reclamos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_reclamo" do
    assert_difference('TipoReclamo.count') do
      post :create, tipo_reclamo: { nombre: @tipo_reclamo.nombre }
    end

    assert_redirected_to tipo_reclamo_path(assigns(:tipo_reclamo))
  end

  test "should show tipo_reclamo" do
    get :show, id: @tipo_reclamo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_reclamo
    assert_response :success
  end

  test "should update tipo_reclamo" do
    patch :update, id: @tipo_reclamo, tipo_reclamo: { nombre: @tipo_reclamo.nombre }
    assert_redirected_to tipo_reclamo_path(assigns(:tipo_reclamo))
  end

  test "should destroy tipo_reclamo" do
    assert_difference('TipoReclamo.count', -1) do
      delete :destroy, id: @tipo_reclamo
    end

    assert_redirected_to tipo_reclamos_path
  end
end
