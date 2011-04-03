class Comment < ActiveRecord::Base

  validates :body, :presence => true
  validates :tenant_id, :presence => true
#  validates :tenant_id, :presence => true
  
  
  belongs_to :user  
  has_one :tenant

end
