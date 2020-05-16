class VideoSuggester
  def self.get_videos(article)
    terms = get_watson_concepts(article)
    get_youtube_videos(article.cached_tag_list, terms)
  end

  def self.get_watson_concepts(article)
    raw_json = WatsonService.get_keywords(article)

    if !raw_json.nil? && raw_json.include?(:concepts) && raw_json[:concepts] != []
      relevant_terms = raw_json.find_all {|concept| concept[:relevance].round(3) >= 0.85}

      relevant_terms.map{|term| term[:text]}[0..2]
    else
      ['Beginner', 'Software', 'Development']
    end
  end

  def self.get_youtube_videos(tags, terms)
    search_terms = "#{tags.split(',').join(' | ')} + #{terms.join(' | ')}"
    raw_json = YoutubeService.get_videos(search_terms)[:items]
  end

end
