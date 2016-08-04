class Location < ApplicationRecord
  geocoded_by :ip_address
  after_validation :geocode


end
