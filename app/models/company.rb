class Company < ApplicationRecord
  has_many :applications
  has_many :users, :through => :applications

  validates :name, :address, :telephone_number, :contact_person, presence: true

  def company_url
    self.name.gsub(" ", "").downcase.concat('.com')
  end

  def have_applied
    "Applied"
  end

  def have_not_applied
    "Not yet applied"
  end
end
