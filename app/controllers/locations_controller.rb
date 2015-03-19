require 'open-uri'
require 'json'

class LocationsController < ApplicationController

  def address
    address = (params['address'])
    safe_address = URI.encode(address)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{safe_address}"

    open_url = open(url).read
    json_parsed_data = JSON.parse(open_url)

    lat = json_parsed_data['results'][0]['geometry']['location']['lat']
    lng = json_parsed_data['results'][0]['geometry']['location']['lng']

    # grabs the address user put, stored it into Google API url, opened, JSON parsed it pulled out lat and lng from the hash array

    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=8000&types=gym&keyword=fitness&key=#{ENV['googles_api_key']}"

    open_url = open(url).read
    json_parsed_data = JSON.parse(open_url)

    @gyms = json_parsed_data['results']
    place_id = json_parsed_data['results'][0]['place_id']
# CANT GET PLACE ID FROM FIRST URL JSON TO GO INTO SECOND URL JSON TO RETRIEVE ADDRESS FOR THAT LOCATION.


    # places ID request



    url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{ENV['googles_api_key']}"
    open_url = open(url).read
    json_parsed_data = JSON.parse(open_url)



    @address_of_gym = json_parsed_data['result']




  end
end
