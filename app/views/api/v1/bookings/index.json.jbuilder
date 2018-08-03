json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :start_date, :end_date, :user_id, :item_id
  end
end
