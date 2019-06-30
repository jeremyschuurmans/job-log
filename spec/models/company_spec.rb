require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'is valid with valid attributes'
  it 'is invalid without a name'
  it 'is invalid without an address'
  it 'is invalid without a telephone number'
  it 'is invalid without a contact person'
end
