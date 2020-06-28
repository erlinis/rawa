class LogoutController < ApplicationController
  include LogoutHelper

  def logout
    reset_session
    redirect_to logout_url_auth0.to_s
  end
end
