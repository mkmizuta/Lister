require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  validates :username, :email, presence: true, uniqueness: true
  validates_format_of :email, { with: /\w+@\w+\.\w+/, message: "is not a valid address" }
  validates :password, presence: true, length: { minimum: 6, too_short: "must be at least 6 characters" }
  validates_confirmation_of :password
  validates :password_confirmation, presence: true 

  before_save :hash_password

  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def self.authenticate(username, password)
    if user = find_by_username(username)
      if BCrypt::Password.new(user.password_digest).is_password? password
        return user
      end
    end
    
    return nil
  end
end



