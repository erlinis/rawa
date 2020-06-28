#  frozen_string_literal: true

# Controller that handles the Auth0 callback
class Auth0Controller < ApplicationController
  def callback
    #  All the user information that came from Auth0 and the IdP
    auth_info = request.env['omniauth.auth']

    user_info = auth_info['info']
    session[:userinfo] = {
      name: user_info['name'],
      email: user_info['email'],
      image: user_info['image']
    }

    # Redirect to the URL you want after successful auth
    redirect_to '/dashboard'
  end

  def failure
    # show a failure page or redirect to an error page

    error_type = request.params['message']
    error_desc = request.params['error_description']

    redirect_to root_url, alert: "#{error_type}: #{error_desc}"
  end
end
