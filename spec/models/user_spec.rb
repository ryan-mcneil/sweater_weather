require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  it 'should generate an API key on creation' do
    user = User.create(email: "example@gmail.com", password: "password")
    expect(user.api_key.size).to eq 30
  end
end
