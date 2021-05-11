json.extract! article, :id, :article_url, :video_id, :stream, :title, :created_at, :updated_at
json.url article_url(article, format: :json)
