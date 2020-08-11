class FavoriteArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_articles do |t|
      t.belongs_to :article
      t.belongs_to :user_profile
      t.timestamps
    end
  end
end
