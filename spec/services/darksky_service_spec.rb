require 'rails_helper'

describe 'DarkskyService' do
  it 'exists' do
    coords = '39.7392358,-104.990251'
    service = DarkskyService.new(coords)

    expect(service).to be_a DarkskyService
  end

  context 'instance methods' do
    context '#get_forecast_json' do
      it 'returns a hash' do
        VCR.use_cassette("darksky_service_forecast") do
          coords = '39.7392358,-104.990251'
          service = DarkskyService.new(coords)

          json = service.get_forecast_json

          expect(json).to be_a Hash
          expect(json[:latitude]).to eq 39.7392358
          expect(json[:currently][:summary]).to eq "Clear"
          expect(json[:hourly][:summary]).to eq "Clear throughout the day."
        end
      end


    end
  end
end
