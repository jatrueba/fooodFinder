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



  # def set_cache_headers
  #   response.headers["Cache-Control"] = "private, max-age=0, no-store"
  # end
  #called after index action (when we come back to the home page)
  # def clear_location
  #   session.delete(:location)
  # end
  #
  # #called after index action: clear
  # def clear_coordinates
  #   session.delete(:lat_lon)
  # end

  #clear the cache to avoid persistence of cached varialbles [:lat_lon],
  #[:location] when hitting the back button.



end
