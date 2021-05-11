class Article < ApplicationRecord
  before_create :update_highlight_url
  after_create :flush_latest_article_cache

  def self.latest_articles
    Rails.cache.fetch('latest_100', expires_in: 0) { limit(100).to_a }
  end

  def flush_latest_article_cache
    Rails.cache.delete('latest_100')
  end

  def update_highlight_url
    generate_highlight_url = "http://qa2.apv.snackly.co/api/candidate/create_highlight?stream=#{self.stream.parameterize}"
    #response = RestClient.get(generate_highlight_url)

    #Overwritten and hardcoded as the provided url is giving bad gateway error
    response_overwritten = {highlight_url: "https://minute.static/somehashcode.mp4"}
    self.highlight_url = response_overwritten[:highlight_url]
  end
end
