require 'rails_helper'

RSpec.describe Application, type: :model do
  it 'is valid with valid attributes' do
    application = Application.create(company_name: "Codeco", date: "2019-06-29", followup: false)

    expect(application).to be_valid
  end

  it 'is invalid without a company name' do
    application = Application.create(company_name: "", date: "2019-06-29", followup: false)

    expect(application).to be_invalid
  end
end
