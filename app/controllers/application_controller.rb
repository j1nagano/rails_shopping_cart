class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, if: :need_authentication?
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end

  protected
    def configure_permitted_parameters
      added_attrs = [ :email, :password, :password_confirmation, :address, :name ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

    def need_authentication?
      not ( is_casein? or is_home_index? )
    end
    def is_home_index?
      controller_name == 'home' and action_name == 'index'
    end
    def is_casein?
      self.class.to_s.split('::').first == 'Casein'
    end
end
