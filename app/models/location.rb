require 'geocoder'
class Location < ApplicationRecord

  ##################Class Methods - Can be called from the Locations Controller################
  ##############################And within the class itself####################################

  #Create a new @locations array.
  #Take each location in the google places API response,
  #wrap it in a ruby @location object, load it in the @locations array,
  #return the @locations array to the location#show action.
  def self.load_response(response)
    #p response

    @locations = []
    response.each do |loc|
      @location = self.new
      @location.name = loc["name"]
      @location.image = loc["icon"] #in the struggle, it's real!!
      @location.address = loc["vicinity"]
      @location.price_range = loc["price_level"]
      @location.rating = loc["rating"]
      @locations << @location
    end
    @locations

    #If we were to persist the records, it would have to be done here.
    #Instead of parsing to a location object, we would have to parse to params[:key],
    #then pass the params array back to the controller's create action, then
    #then pass a random collection that meets the search parameters to the user
    #thrugh the show view.

  end

  #Use the lat and long provided by get_lat_and_long method to build the call to google API.
  #Pass the response to load_response, which will wrap the response in an @location instance.
  def self.call_google_places_api(lat_lon)
    @response =  HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=
    #{lat_lon}&type=restaurant&radius=1000&key=AIzaSyAJXiGppzM31B83N26w46jvTgjQ8wYCdwQ").parsed_response["results"]
    load_response(@response)
  end

  #Get lat and long using Geocoder module, based on the user input from form_tag in index.html.erb.
  #Once lat and long is obtained by Geocoder, pass the lat and long to call_google_places_api.

  def self.get_search_results(location, coordinates)
    puts "Coordinates #{coordinates}"
    if coordinates
      self.call_google_places_api(coordinates)
    else
      # this is working
      puts "Location #{location}"
      search_locations = Geocoder.search(location)
      lat = search_locations[0].latitude
      lon = search_locations[0].longitude
      coordinates = (lat.to_s) + "," + (lon.to_s)
      self.call_google_places_api(coordinates)
    end
  end

end
