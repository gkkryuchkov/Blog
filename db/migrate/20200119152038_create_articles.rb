class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.string :description
      t.text :body, null:false
      t.references :section, foreign_key: true
      t.references :user_profile, foreign_key: true
      t.timestamps
    end
  end
end
