class AdminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :class => AdminController
  layout "dashboard"

  def index
  end
end
