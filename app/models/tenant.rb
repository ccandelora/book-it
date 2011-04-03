class Tenant < ActiveRecord::Base
  validates :name, :presence => true
  validates :address, :presence => true
  validates :city, :presence => true
  validates :email, :uniqueness => true
  validates :phone, :presence => true
  
  has_many :bookings, :dependent => :destroy
  has_many :comments, :order => 'created_at DESC'
end
