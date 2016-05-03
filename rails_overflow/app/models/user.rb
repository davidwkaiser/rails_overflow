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

  def authenticate(pass_to_check)

    if self.password == pass_to_check
      return true
    else
      return nil
    end
  end


end
