class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def save_location
    session[:location] ||= params[:search_location]
  end

  def clear_location
    session[:location] = nil
  end

end
