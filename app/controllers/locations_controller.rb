class LocationsController < ApplicationController
  def index

    # @location = Location.all
    @location = request.location

  end

def create
  @location = Location.new
end


end
