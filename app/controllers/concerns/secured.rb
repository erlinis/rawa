#  frozen_string_literal: true

# Concern to check authentication before to access to an action that need it
module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to '/' unless session[:userinfo].present?
  end
end
