class RenameTypeToBookingType < ActiveRecord::Migration
  def self.up
    rename_column :bookings, :type, :booking_type    
  end

  def self.down
    rename_column :bookings, :booking_type, :type
  end
end
