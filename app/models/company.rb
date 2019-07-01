class Company < ApplicationRecord
  belongs_to :user
  belongs_to :application

  validates :name, :address, :telephone_number, :contact_person, presence: true

end
