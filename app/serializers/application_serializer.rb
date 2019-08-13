class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :date, :followup, :response

  belongs_to :company
  belongs_to :user
end
