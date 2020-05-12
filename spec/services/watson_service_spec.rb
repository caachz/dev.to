require "rails_helper"

RSpec.describe WatsonService, type: :service, vcr: {} do

  scenario "call on watson api" do
    json_response = File.read('spec/fixtures/files/watson_response.json')

    response = stub_request(:post, "https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/v1/analyze?features=concepts&url=https://dev.to/vinaybommana7/django-
      mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl&version=2019-07-12").to_return(status: 200, body: json_response)

      url = 'https://dev.to/vinaybommana7/django-mysql-how-to-port-your-web-application-from-sqlite-to-mysql-3jnl'
      response = WatsonService.get_keywords(url)

      expect(response.first[:text]).to eq("SQL")
  end
end
