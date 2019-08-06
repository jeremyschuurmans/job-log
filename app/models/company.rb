class Company < ApplicationRecord
  has_many :applications
  has_many :users, :through => :applications

  validates :name, :address, :telephone_number, :contact_person, presence: true

end
