require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is not a valid address"}
  validates :password, presence: true 
  validates_confirmation_of :password
  validates :password_confirmation, presence: true 
  validates :password, length: { minimum: 6, too_short: "must be at least 6 characters" }

  before_save :hash_password

  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end


end
