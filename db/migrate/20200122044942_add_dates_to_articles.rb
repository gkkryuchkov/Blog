class AddDatesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :publish_date,:datetime

  end
end
