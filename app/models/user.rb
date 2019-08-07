class User < ApplicationRecord
  has_many :applications, dependent: :destroy
  has_many :companies, :through => :applications
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true,
                    case_sensitive: false
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }
end
