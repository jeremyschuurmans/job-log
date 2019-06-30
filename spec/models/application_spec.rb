require 'rails_helper'

RSpec.describe Application, type: :model do
  it 'is valid with valid attributes' do
    application = Application.create(company: "Codeco", date: 06/29/2019, followup: false)

    expect(application).to be_valid
  end

  it 'is invalid without a company name' do
    application = Application.create(company: "", date: 06/29/2019, followup: false)

    expect(application).to be_invalid
  end

  it 'is invalid without a date' do
    application = Application.create(company: "Codeco", followup: false)

    expect(application).to be_invalid
  end
end
