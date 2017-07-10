class WelcomeController < ApplicationController
  before_action :require_login

  def show
    redirect_to user_path(current_user)
  end
end
