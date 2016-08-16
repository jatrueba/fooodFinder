require 'geocoder'
class Location < ApplicationRecord

  ##################Class Methods - Can be called from the Locations Controller################
  ##############################And within the class itself####################################

  #Create a new @locations array.
  #Take each location in the google places API response,
  #wrap it in a ruby @location object, load it in the @locations array,
  #return the @locations array to the location#show action.
  #in the struggle, it's real!!
  def self.load_response(response)
    puts "This is #{response}"
    if response.empty?
      @locations = []
      @location =self.new
      @location.name = "No restaurants around the area"
      @location.address = ""
      @location.rating = ""
      @location.image = "restaurant.png"
      @locations
      @locations << @location
    else
      @locations = []
      response.each do |loc|
        @location = self.new
        @location.name = loc['name']
        @location.address = loc['vicinity']
        @location.rating = loc['rating']

        if loc['photos']
          @location.image = loc['photos'][0]['photo_reference']
        else
          @location.image = 'restaurant.png'
        end

        price_range = loc['price_level']
        case price_range
        when 0..1
          @location.price_range = '$'
        when 1..2
          @location.price_range = '$$'
        when 2..3
          @location.price_range = '$$$'
        when 3..4
          @location.price_range = '$$$$'
        end
        @locations << @location
      end
    @locations
    end
  end

  #Use the lat and long provided by get_lat_and_long method to build the call to google API.
  #Pass the response to load_response, which will wrap the response in an @location instance.
  def self.call_google_places_api(lat_lon, radius)

    search_radius = radius
    case search_radius
    when '5 miles'
      api_radius = '8047'
    when '10 miles'
      api_radius = '16093'
    when '15 miles'
      api_radius = '24140'
    else
      api_radius = '8047'
    end

    # puts "This is radius in API call#{api_radius}"

    @response =  HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=
    #{lat_lon}&type=restaurant&radius=#{api_radius}&key=#{ENV['GOOGLE_PLACES_API']}", :verify => false ).parsed_response['results']
    load_response(@response)
  end

  #Get lat and long using Geocoder module, based on the user input from form_tag in index.html.erb.
  #Once lat and long is obtained by Geocoder, pass the lat and long to call_google_places_api.

  def self.get_search_results(location, coordinates, radius)
    search_radius = radius
    if location != ''
      search_locations = Geocoder.search(location)
      puts "Seach location#{search_locations}"
      lat = search_locations[0].latitude
      puts "This is lat #{lat}"
      lon = search_locations[0].longitude
      puts "This is lon #{lon}"
      coordinates = (lat.to_s) + ',' + (lon.to_s)
      puts "This is coordinates #{coordinates}"
      self.call_google_places_api(coordinates, search_radius)
    else
      self.call_google_places_api(coordinates, search_radius)
    end
  end

end
