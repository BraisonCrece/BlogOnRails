class RemoveColumnTagFromArticlesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :tag
  end
end
