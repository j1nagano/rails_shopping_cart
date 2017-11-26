class ApplicationController < ActionController::Base
  before_action :authenticate_customer!, except: [:index]
  protect_from_forgery with: :exception
end
