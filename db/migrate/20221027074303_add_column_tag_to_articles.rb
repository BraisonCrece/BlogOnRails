class AddColumnTagToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :tag, :string
  end
end
