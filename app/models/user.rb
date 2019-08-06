class User < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :companies, :through => :applications

  has_secure_password

  validates :name, :email, :password_digest, presence: true, uniqueness: true
end
