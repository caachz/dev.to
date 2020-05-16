require "rails_helper"

RSpec.describe TermSuggester, type: :labor, vcr: {} do
  let(:user) { create(:user) }

  scenario "returns list of terms" do

    json_response = File.read('spec/fixtures/files/watson_response.json')

    response = stub_request(:post, "https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/v1/analyze?features=concepts&url=https://dev.to/vinaybommana7/django-
      mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl&version=2019-07-12").to_return(status: 200, body: json_response)

      url = 'https://dev.to/vinaybommana7/django-mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl'

      create_list(:article, 4, user: user, featured: true, tags: ["discuss"])

      article = create(:article, user: user, featured: true, tags: ["non-dairy", "hipster"], feed_source_url: url, body_markdown: "---\ntitle: The Skull Beneath the Skin1\npublished: true\ntags: [\"discuss\"]\ndate: \nseries: \ncanonical_url: \n---\n\nFive dollar toast gentrify sustainable. Chia microdosing banh mi vegan wayfarers occupy. Asymmetrical venmo yuccie fingerstache pug kickstarter tofu mumblecore.\n\nForage hella knausgaard migas cleanse xoxo artisan flannel.\n\n")
      expect(TermSuggester.get_terms(article)).to eq(["Vietnamese cuisine", "Skull", "Skull and Bones"])

  end
end
