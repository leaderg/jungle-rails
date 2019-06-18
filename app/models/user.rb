class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates_length_of :password, :minimum => 5
  validates :password_digest, presence: true

end
