class Booking < ActiveRecord::Base
  validates :tenant_id, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :price, :presence => true
  validates :persons, :presence => true
  validates :status, :presence => true

  belongs_to :tenant
  
  has_one :payment
  
  default_scope order('bookings.start_date')
end
