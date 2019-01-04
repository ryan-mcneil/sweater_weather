require 'rails_helper'

describe 'GiphyService' do
  it 'exists' do
    summary = "Clear throughout the day."
    service = GiphyService.new(summary)

    expect(service).to be_a GiphyService
  end

  context 'instance methods' do
    context '#get_gif_json' do
      it 'returns a hash' do
        VCR.use_cassette("giphy_service_gif") do
          summary = "Clear throughout the day."
          service = GiphyService.new(summary)

          gif_data = service.get_gif_json
          expect(gif_data).to be_a Hash
          expect(gif_data[:data][0][:url]).to be_a String
        end
      end
    end
  end
end
