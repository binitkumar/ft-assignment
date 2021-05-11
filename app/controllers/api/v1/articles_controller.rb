class Api::V1::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  caches_action :index

  def index
    @articles = Article.latest_articles
    render json: @articles
  end

  # POST /articles or /articles.json
  def create
    expire_action :action => :index
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end


  # Only allow a list of trusted parameters through.
  def article_params
    params.permit(:article_url, :video_id, :stream, :title)
  end
end
