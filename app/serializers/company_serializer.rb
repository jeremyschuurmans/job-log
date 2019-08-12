class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :telephone_number, :contact_person, address: [:street_address, :city, :state, :zip_code]

  has_many :applications
  has_many :users, :through => :applications
end
