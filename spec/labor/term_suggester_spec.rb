require "rails_helper"

RSpec.describe TermSuggester, type: :labor do
  let(:user) { create(:user) }

  scenario "returns list of terms" do
    json_response = File.read('spec/fixtures/files/watson_response.json')

    response = stub_request(:post, "https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/v1/analyze?features=concepts&url=https://dev.to/vinaybommana7/django-
      mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl&version=2019-07-12").to_return(status: 200, body: json_response)

      url = 'https://dev.to/vinaybommana7/django-mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl'
      response = WatsonService.get_keywords(url)

    create_list(:article, 4, user: user, featured: true, tags: ["discuss"])
    article = create(:article, user: user, featured: true, tags: ["discuss"], feed_source_url: url)
    expect(TermSuggester.get_terms(article)).to eq(4)
  end
end
