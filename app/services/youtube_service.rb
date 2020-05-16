class YoutubeService
  def self.get_videos(search_term)
    videos_json(search_term)

  end

  def self.videos_json(search_term)
    response = conn.get("?part=snippet&maxResults=10&q=#{search_term}&key=#{ENV['YOUTUBE_API_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://www.googleapis.com/youtube/v3/search")
  end
end
