class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :telephone_number, :contact_person, :address, :applied

  has_many :applications
  has_many :users, :through => :applications
end
