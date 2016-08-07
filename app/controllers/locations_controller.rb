require 'httparty'
require 'json'
#require 'google_places-0.21.0'
class LocationsController < ApplicationController
  before_action :save_location, only: :show
  after_action :clear_location, only: :index

  def index
    #render index.html.erb.
  end

  #1. The zip code or location given by the user in index.html.erb
  #   is loaded inside the params hash.
  #2. The Location model's get_lat_and_long method is called, and we pass it the
  #   params hash containting the user input

  def show
    location = params[:search_location] || session[:location]
    @locations = Location.get_search_results(location)
  end

  # def new
  #   @location = Location.new
  # end

  # def create
  #   #@restaurant = Location.new(location_params)
  #   @location.save
  # end
  #
  # private
  #
  # def loacation_params
  #   params.require(:location).permit(:name, :address, :phone, :website, :rating, :price_range, :image, :latitude, :longitude)
  # end

end










# @client = GooglePlaces::Client.new(API_KEY)#(AIzaSyAuw4no8ETufFiyu3FrBgOf4_rtZODlIoU)
# @client.spots(-33.8670522, 151.1957362, :types => ['restaurant','food'])
# p @client
