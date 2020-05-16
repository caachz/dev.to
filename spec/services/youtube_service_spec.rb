require "rails_helper"

RSpec.describe YoutubeService, type: :service, vcr: {} do
  let(:user) { create(:user) }

  scenario "call on youtube api" do

    json_response = File.read('spec/fixtures/files/youtube_response.json')

    search_term = "non-dairy | hipster + Beginner | Software | Development"

    response = stub_request(:get, "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=3&q=#{search_term}&key=#{ENV['YOUTUBE_API_KEY']}").to_return(status: 200, body: json_response)

      response = YoutubeService.get_videos(search_term)

      expect(response[:items][0][:snippet][:title]).to eq("Executives Discuss Dell’s Development Programs And Their Benefits To Recent Graduates")
  end
end
