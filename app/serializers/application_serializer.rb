class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :date

  belongs_to :company
  belongs_to :user
end
