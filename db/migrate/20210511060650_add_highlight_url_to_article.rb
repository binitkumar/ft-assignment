class AddHighlightUrlToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :highlight_url, :string
  end
end
