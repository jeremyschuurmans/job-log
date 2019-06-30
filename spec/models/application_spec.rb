require 'rails_helper'

RSpec.describe Application, type: :model do
  it 'is valid with valid attributes'
  it 'is invalid without a company name'
  it 'is invalid without a date'
  it 'is invalid without a followup toggle'
  it 'is invalid without a response'
end
