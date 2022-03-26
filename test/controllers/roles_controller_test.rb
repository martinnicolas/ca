require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @role = roles(:three)
  end

  test "should get index" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :index
    assert_response :success
  end

  test "should get new" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :new
    assert_response :success
  end

  test "should create role" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    assert_difference('Role.count') do
      post :create, params: { role: { descripcion: @role.descripcion } }
    end

    assert_redirected_to role_path(Role.last)
  end

  test "should show role" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :show, params: { id: @role.id }
    assert_response :success
  end

  test "should get edit" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    get :edit, params: { id: @role }
    assert_response :success
  end

  test "should update role" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    patch :update, params: { 
      id: @role, 
      role: { 
        descripcion: @role.descripcion 
      }
    }
    assert_redirected_to role_path(@role)
  end

  test "should destroy role" do
    # Mimic the router behavior of setting the Devise scope through the env.
    @request.env['devise.mapping'] = Devise.mappings[:user]

    # Use the sign_in helper to sign in a fixture `User` record.
    sign_in users(:two)
    assert_difference('Role.count', -1) do
      delete :destroy, params: { id: @role }
    end

    assert_redirected_to roles_path
  end
end
