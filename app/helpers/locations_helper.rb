module LocationsHelper
  # Parse the API data to store it in an array of hashes so that each bus is a hash.
  def fetch_api_data(source)
    response = Net::HTTP.get_response(URI.parse(source))
    data = response.body
    JSON.parse(data)
  end

  # Compare the user lat/long with a bus to see if it is "nearby" which for now is 0.01 degress of lat/long.
  # TODO: Make this a true circular radius
  # TODO: Give user option of how close
  def is_nearby?(user_lat, user_long, bus_lat, bus_long)
    (user_lat - bus_lat).abs <= 0.01 && (user_long - bus_long).abs <= 0.01
  end
end
