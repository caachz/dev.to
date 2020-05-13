class TermSuggester
  def self.get_terms(article)
    get_watson_concepts(article.feed_source_url)
  end

  def self.get_watson_concepts(article_url)
    raw_json = WatsonService.get_keywords(article_url)

    relevant_terms = raw_json.find_all {|concept| concept['relevance'].round(3) >= 0.85}

    relevant_terms.map{|term| term['text']}[0..2]
    require "pry"; binding.pry
  end

  def self.get_tags(article_tag_list)

  end
end
