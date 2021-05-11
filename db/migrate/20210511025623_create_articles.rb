class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :article_url
      t.string :video_id
      t.string :stream
      t.string :title

      t.timestamps
    end
  end
end
