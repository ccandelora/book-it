class Payment < ActiveRecord::Base
  validates :title, :presence => true
  validates :title, :uniqueness => true

  has_one :booking
end