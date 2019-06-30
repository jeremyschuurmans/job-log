require 'rails_helper'

RSpec.describe Application, type: :model do
  it 'is valid with valid attributes' do
    application = Application.create(company: "Codeco", date: 06/29/2019, followup: true)

    expect(application).to be_valid
  end

  it 'is invalid without a company name'
  it 'is invalid without a date'
  it 'is invalid without a followup toggle'
end
