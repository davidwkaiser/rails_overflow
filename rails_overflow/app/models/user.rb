require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :email, presence: true, uniqueness: true
  has_many  :questions
  has_many :answers

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = self.find_by(email: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end


end
