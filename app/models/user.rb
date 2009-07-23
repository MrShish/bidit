require 'digest/sha1'
class User < ActiveRecord::Base
  validates_presence_of :nick_name
  validates_uniqueness_of :nick_name
  validates_presence_of :first_name
  
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  def self.authenticate(nick_name, password)
    user = self.find_by_nick_name(nick_name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  
  private
  
  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?  
  end
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  
end
