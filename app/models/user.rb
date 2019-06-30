class User < ApplicationRecord
  has_many :companies, dependent: :destroy
  has_many :applications, :through => :companies

  has_secure_password
  
  validates :name, :email, :password_digest, presence: true
end
