class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  before_save {self.username = username.downcase}
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
