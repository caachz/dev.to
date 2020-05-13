class TermSuggester
  def self.get_terms(article)
    get_watson_concepts(article.url)
  end

  def self.get_watson_concepts(article_url)
    raw_json = WatsonService.get_keywords(article_url)
  end
