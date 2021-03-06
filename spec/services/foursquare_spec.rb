require 'rails_helper'

describe Foursquare do
  describe '#venue' do
    it 'finds the venue with the specified id', vcr: { cassette_name: :foursquare_venue_details } do
      id = '4feddd79d86cd6f22dc171a9'
      venue = Foursquare.new.venue(id)
      expect(venue[:id]).to eq(id)
    end
  end
end
