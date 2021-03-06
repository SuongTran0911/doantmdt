class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

   def current_cart
    session[:cart_id] ||= Cart.create!.id
    @current_cart ||= Cart.find(session[:cart_id])
   end

end

