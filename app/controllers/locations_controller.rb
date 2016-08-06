require 'httparty'
class LocationsController < ApplicationController

  def index

    # https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU
  end

  def create
  end

  def show
    #@location = request.location
    @location = Geocoder.search(params[:search_locations])
    p @location
    lat @location[0].latitude
    long @location[0].longitude
    response =  HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&name=cruise&key=AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU")
  end


end
