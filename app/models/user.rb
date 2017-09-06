class User < ApplicationRecord
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: true

  def authenticate(password)
    if password == password
      self
    else
      nil
    end
  end
end
