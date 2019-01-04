require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  it 'should start a nil API key' do
    user = User.new(email: "example@gmail.com", password: "password")
    expect(user.api_key).to eq nil
  end
end
