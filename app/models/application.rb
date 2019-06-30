class Application < ApplicationRecord
  validates :company, :date, :followup, presence: true
end
