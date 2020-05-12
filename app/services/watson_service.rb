class WatsonService
  def self.get_keywords(article)
    keywords_json(article)[:concepts]
  end

  private

  def self.keywords_json(article)
    response = conn.post('/v1/analyze?version=2019-07-12') do |c|
      c.params['url'] = article
      c.params['features'] = 'concepts'
      c.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.us-south.natural-language-understanding.watson.cloud.ibm.com/instances/f3aa86ad-9d96-4e38-b03d-a22906278db8') do |builder|
      builder.use Faraday::Request::BasicAuthentication, 'apikey', ENV['WATSON_API_KEY']
    end
  end
end
