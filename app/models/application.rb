class Application < ApplicationRecord
  has_many :companies, dependent: :destroy
  has_many :users, :through => :companies

  validates :company, :date, presence: true
  validates_inclusion_of :followup, in: [true, false]
end
