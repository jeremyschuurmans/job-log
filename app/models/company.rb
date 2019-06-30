class Company < ApplicationRecord
  belongs_to :user

  validates :name, :address, :telephone_number, :contact_person, presence: true
end
