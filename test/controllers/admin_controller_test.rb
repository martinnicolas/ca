require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get index" do
  	# Mimic the router behavior of setting the Devise scope through the env.
  	@request.env['devise.mapping'] = Devise.mappings[:user]

  	# Use the sign_in helper to sign in a fixture `User` record.
  	sign_in users(:two)
    get :index
    assert_response :success
  end

end
