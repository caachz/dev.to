require "rails_helper"

RSpec.describe YoutubeService, type: :service, vcr: {} do
  let(:user) { create(:user) }

  scenario "call on youtube api" do

    json_response = File.read('spec/fixtures/files/youtube_response.json')

    search_term = 'cute puppies'

    response = stub_request(:get, "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=3&q=#{search_term}&key=#{ENV['YOUTUBE_API_KEY']}").to_return(status: 200, body: json_response)

      url = 'https://dev.to/vinaybommana7/django-mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl'

      create_list(:article, 4, user: user, featured: true, tags: ["discuss"])
      article = create(:article, user: user, featured: true, tags: ["discuss", "butts"], feed_source_url: url, body_markdown: "---\ntitle: The Skull Beneath the Skin1\npublished: true\ntags: [\"discuss\"]\ndate: \nseries: \ncanonical_url: \n---\n\nFive dollar toast gentrify sustainable. Chia microdosing banh mi vegan wayfarers occupy. Asymmetrical venmo yuccie fingerstache pug kickstarter tofu mumblecore.\n\nForage hella knausgaard migas cleanse xoxo artisan flannel.\n\n")

      response = YoutubeService.get_videos(article)

      expect(response.first[:text]).to eq("Vietnamese cuisine")
  end
end
