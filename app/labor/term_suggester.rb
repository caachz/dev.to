class TermSuggester
  def self.get_terms(article)
    get_watson_concepts(article)
  end

  def self.get_watson_concepts(article)
    raw_json = WatsonService.get_keywords(article)

    relevant_terms = raw_json.find_all {|concept| concept[:relevance].round(3) >= 0.85}

    relevant_terms.map{|term| term[:text]}[0..2]
  end

end
