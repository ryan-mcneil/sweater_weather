require 'rails_helper'

describe 'GiphyService' do
  it 'exists' do
    summary = "Clear throughout the day."
    service = GiphyService.new(summary)

    expect(service).to be_a GiphyService
  end
end
