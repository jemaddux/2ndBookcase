class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private

  def authorize
    redirect_to root_url if current_admin.nil?
  end

  def current_admin
    @admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def current_customer
    @customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def current_user
    @current_user ||= current_customer
  end

  def authorize
    redirect_to root_url if current_user.nil?
  end

  def first_available_inventory(book_id)
    @inventory = Inventory.where(book_id: book_id, checked_out: false, in_circulation: true).first
  end

  helper_method :first_available_inventory
  helper_method :current_customer
  helper_method :current_user
  helper_method :current_admin
end
