require 'httparty'
require 'json'
class LocationsController < ApplicationController

  def index
 # https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU
  end

  def create
  end

  def show
    # @location = request.location
    @location = Geocoder.search(params[:search_locations])
    lat = @location[0].latitude
    lat_s = lat.to_s
    long = @location[0].longitude
    p lat_s.class
    long_s = long.to_s
      response =  HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat_s},#{long_s}&type=restaurant&radius=1000&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU")
      byebug
      response

  end


end
