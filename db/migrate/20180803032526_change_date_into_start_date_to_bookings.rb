class ChangeDateIntoStartDateToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
