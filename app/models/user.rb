require 'digest'

class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :password
  attr_accessor :password

  before_save :encrypt_password

  has_many :products

  protected
  def encrypt
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def encrypt(string)
  Digest::SHA1.hexdigest(string)
  end

end
