json.extract! carona, :id, :driver_name, :departure, :destination, :date_time, :passengers_number, :cost, :obs, :created_at, :updated_at
json.url carona_url(carona, format: :json)
