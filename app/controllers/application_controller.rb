class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_customer
    @customer = Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def current_user
    @current_user ||= current_customer
  end

  def authorize
    redirect_to root_url if current_user.nil?
  end

  helper_method :current_customer
  helper_method :current_user

end
