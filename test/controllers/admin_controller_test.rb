require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  test "should get index" do
  	sign_in @user
	sign_in @user, scope: :admin
    get :index
    assert_response :success
  end

end
