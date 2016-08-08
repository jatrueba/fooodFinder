class Location < ApplicationRecord
  # geocoded_by :ip_address
  # after_validation :geocode

  # To research:
  #   a. Yelp API
  #   b. How to pass a variable from JavaScript to Rails back end
  #   c. How to use Ajax to simulate the swipe left to right capability
  #

  ##################Class Methods - Can be called from the Locations Controller################
  ##############################And within the class itself####################################

  #Create a new @locations array.
  #Take each location in the google places API response,
  #wrap it in a ruby @location object, load it in the @locations array,
  #return the @locations array to the location#show action.
  def self.load_response(response)
    # p response
    @locations = []
    response.each do |loc|
      @location = self.new
      @location.name = loc["name"]
      #@location.image = loc[]
      @location.address = loc["vicinity"]
      @location.price_range = loc["price_level"]
      @location.rating = loc["rating"]
      @locations << @location
    end
    @locations
  end

  #Use the lat and long provided by get_lat_and_long method to build the call to google API.
  #Pass the response to load_response, which will wrap the response in an @location instance.
  def self.call_google_places_api(lat, lon)
    @response =  HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=
    #{lat},#{lon}&type=restaurant&radius=1000&key=#{ENV["GOOGLE_PLACES_API"]}").parsed_response["results"]
    load_response(@response)
  end

  #Get lat and long using Geocoder module, based on the user input from form_tag in index.html.erb.
  #Once lat and long is obtained by Geocoder, pass the lat and long to call_google_places_api.
  def self.get_search_results(location)
    search_locations = Geocoder.search(location)
    lat = search_locations[0].latitude
    lon = search_locations[0].longitude
    self.call_google_places_api(lat, lon)
  end

end
