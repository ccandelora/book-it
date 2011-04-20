class Booking < ActiveRecord::Base
  has_event_calendar :start_at_field  => 'start_date', :end_at_field => 'end_date'
  
  validates :tenant_id, :presence => true
  validates :start_date, :presence => true
  validates :end_date, :presence => true
  validates :price, :presence => true
  validates :payment_id, :presence => true  
  validates :persons, :presence => true
  validates :status, :presence => true

  belongs_to :tenant
  
  has_one :payment
  
  default_scope order('bookings.start_date')
end
