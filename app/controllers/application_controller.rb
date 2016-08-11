class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  #called before the show action
  def save_location
    session[:location] ||= params[:search_location]
  end

  #called after index action (when we come back to the home page)
  def clear_location
    session[:location] = nil
  end

  def clear_coordinates
    session[:lat_lon] = nil
  end


  def save_coordinates
    if session[:lat_lon] == nil
      session[:lat_lon] = params[:lat] + "," + params[:long]
    else
      session[:lat_lon]
    end
  end
end
