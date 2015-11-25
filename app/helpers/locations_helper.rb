module LocationsHelper
  # Parse the API data to store it in an array of hashes so that each bus is a hash.
  def fetch_api_data(source)
    response = Net::HTTP.get_response(URI.parse(source))
    data = response.body
    JSON.parse(data)
  end

  # Compare the user lat/long with a bus to see if it is "nearby" which for now is 0.01 degress of lat/long.
  def is_nearby?(user_lat, user_long, bus_lat, bus_long, distance)
    nearby_lat = distance / 69
    nearby_long = distance / 58
    (user_lat - bus_lat).abs <= nearby_lat && (user_long - bus_long).abs <= nearby_long
  end
end
