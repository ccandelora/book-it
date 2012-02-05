require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  
  validates :password, :confirmation  => true,
                       :length => { :within => 4..20 },
                       :presence => true,
                       :if => :password_required?
  validates :email, :presence => true
  validates :name, :presence => true
  
  has_many :comments, :dependent => :destroy
  
  before_save :encrypt_new_password
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  def is_admin(username)
    if username.account_type == 1
      return true
    else
      return false
    end
  end
  
  def pretty_user(username)
    if(username.account_type == 1)
      return "admin"
    else
      return "user"
    end
  end
  
  protected
    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end

    def password_required?
      hashed_password.blank? || password.present?
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
