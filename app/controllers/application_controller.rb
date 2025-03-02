class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Ensure this line is present
end