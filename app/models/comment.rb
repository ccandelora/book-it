class Comment < ActiveRecord::Base
  validates :body, :presence => true
  validates :tenant_id, :presence => true

  belongs_to :user  
  belongs_to :tenant

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end