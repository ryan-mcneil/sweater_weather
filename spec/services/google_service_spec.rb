require 'rails_helper'

describe 'GoogleService' do
  it 'exists' do
    location = 'denver,co'
    service = GoogleService.new(location)

    expect(service).to be_a GoogleService
  end

  context 'instance methods' do
    context '#get_coords' do
      it 'returns a hash of coordinates' do
        VCR.use_cassette 'google_service_location' do
          location = 'denver,co'
          service = GoogleService.new(location)
          coords = service.get_coords
          expect(coords.size).to eq 2
          expect(coords[:lat]).to eq 39.7392358
          expect(coords[:lng]).to eq -104.990251
        end
      end
    end
  end
end
