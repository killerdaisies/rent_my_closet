json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking, :id, :date, :user_id, :item_id
  end
end
