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

          forecast_data = service.get_forecast_json

          expect(forecast_data).to be_a Hash
          expect(forecast_data[:latitude]).to eq 39.7392358
          expect(forecast_data[:currently][:summary]).to be_a String
          expect(forecast_data[:hourly][:summary]).to be_a String
        end
      end


    end
  end
end
