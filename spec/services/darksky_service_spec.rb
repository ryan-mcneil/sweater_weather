require 'rails_helper'

describe 'DarkskyService' do
  it 'exists' do
    coords = '39.7392358,-104.990251'
    service = DarkskyService.new(coords)

    expect(service).to be_a DarkskyService
  end
end
