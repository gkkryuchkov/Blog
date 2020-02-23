class AddHiddenToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :hidden, :integer, default: 1
  end
end
